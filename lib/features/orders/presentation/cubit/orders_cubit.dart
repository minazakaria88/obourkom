import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/locations/data/models/location_order_model.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../data/models/new_order_model.dart';
import '../../data/repositories/order_repo.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit({required this.orderRepository})
    : super(OrdersState());
  final OrderRepository orderRepository;
  final formKey = GlobalKey<FormState>();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  void pickDeliveryLocation(LocationOrderModel model) async {
    emit(
      state.copyWith(
        deliveryLocation: LatLng(
          model.position!.latitude,
          model.position!.longitude,
        ),
        deliveryLocationData: model.address,
      ),
    );
  }

  void pickPickupLocation(LocationOrderModel model) async {
    emit(
      state.copyWith(
        pickedLocation: LatLng(
          model.position!.latitude,
          model.position!.longitude,
        ),
        pickedLocationData: model.address,
      ),
    );
  }

  void pickPaymentMethod(String applePay) {
    emit(state.copyWith(paymentMethod: applePay));
  }

  void makeOrder() async {
    try {
      emit(state.copyWith(makeOrderStatus: MakeOrderStatus.loading));
      final model = await getNewOrderModel();
      await orderRepository.makeOrder(model.toJson());
      emit(state.copyWith(makeOrderStatus: MakeOrderStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          makeOrderStatus: MakeOrderStatus.failure,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          makeOrderStatus: MakeOrderStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<NewOrderModel> getNewOrderModel() async {
    return NewOrderModel(
      customerId: CacheHelper.getData(
        key: CacheHelperKeys.customerId,
      ).toString(),
      fromLat: state.pickedLocation!.latitude,
      fromLng: state.pickedLocation!.longitude,
      toLat: state.deliveryLocation!.latitude,
      toLng: state.deliveryLocation!.longitude,
      notes: notesController.text,
      paymentType: state.paymentMethod,
      status: 'pending',
      statusPaid: 'unpaid',
    );
  }

  void getOrders(int page) async {
    emit(state.copyWith(getOrdersStatus: GetOrdersStatus.loading));
    try {
      final result = await orderRepository.getOrders(page);
      final recentOrder = List<OrderDataModel>.from([]);
      final completedOrder = List<OrderDataModel>.from([]);
      final orders = result.data ?? [];
      for (var element in orders) {
        if (element.status == 'pending' || element.status == 'inProgress') {
          recentOrder.add(element);
        }
        else if (element.status == 'completed') {
          completedOrder.add(element);
        }
      }
      emit(
        state.copyWith(
          getOrdersStatus: GetOrdersStatus.success,
          recentOrdersList: state.recentOrdersList == null
              ? recentOrder
              : [...state.recentOrdersList!, ...recentOrder],
          completedOrdersList: state.completedOrdersList == null
              ? completedOrder
              : [...state.completedOrdersList!, ...completedOrder],
        ),
      );
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          getOrdersStatus: GetOrdersStatus.failure,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getOrdersStatus: GetOrdersStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void getMoreOrders(ScrollController scrollController) async {
    int page = 2;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (state.getOrdersStatus != GetOrdersStatus.loading) {
          getOrders(page++);
        }
      }
    });
  }



  disposeControllers() {
    codeController.dispose();
    notesController.dispose();
    messageController.dispose();
  }

  @override
  Future<void> close() {
    disposeControllers();
    return super.close();
  }

  void setDiscountCode(String value) {
    logger.d(value);
  }
}
