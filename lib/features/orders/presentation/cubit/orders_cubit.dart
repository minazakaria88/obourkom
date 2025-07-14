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
import '../../../../core/functions/concatenate_placemark.dart';
import '../../data/models/new_order_model.dart';
import '../../data/repositories/order_repo.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit({required this.otpRepository})
    : super(OrdersState(orderTimerDuration: const Duration(minutes: 5)));
  final OrderRepository otpRepository;
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
     // final model = getNewOrderModel();
      emit(state.copyWith(makeOrderStatus: MakeOrderStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      //final result = await otpRepository.makeOrder(model.toJson());
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

  NewOrderModel getNewOrderModel() {
    return NewOrderModel(
      pickUpLocation: state.pickedLocation!,
      dropOffLocation: state.deliveryLocation!,
      pickUpAddress:
          concatenatePlacemark(place: state.pickedLocationData) ?? '',
      dropOffAddress:
          concatenatePlacemark(place: state.deliveryLocationData) ?? '',
      paymentMethod: state.paymentMethod!,
      notes: notesController.text,
      discount: codeController.text,
    );
  }

  void getOrders() async {
    emit(state.copyWith(getOrdersStatus: GetOrdersStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      // final result = await otpRepository.getOrders();
      final result = [
        OrderModel(
          cost: '1000',
          id: '1',
          orderNumber: '100',
          serviceType: 'نقل أثاث',
          truckType: 'كبير',
          status: 'waiting',
        ),
        OrderModel(
          cost: '1000',
          id: '1',
          orderNumber: '100',
          serviceType: 'نقل أثاث',
          truckType: 'كبير',
          status: 'inProgress',
        ),
        OrderModel(
          cost: '1000',
          id: '1',
          orderNumber: '100',
          serviceType: 'نقل أثاث',
          truckType: 'كبير',
          status: 'completed',
        ),
        OrderModel(
          cost: '1000',
          id: '1',
          orderNumber: '100',
          serviceType: 'نقل أثاث',
          truckType: 'كبير',
          status: 'completed',
        ),
      ];
      final recentOrder = List<OrderModel>.from([]);
      final completedOrder = List<OrderModel>.from([]);
      for (var element in result) {
        if (element.status == 'waiting' || element.status == 'inProgress') {
          recentOrder.add(element);
        } else if (element.status == 'completed') {
          completedOrder.add(element);
        }
      }
      emit(
        state.copyWith(
          getOrdersStatus: GetOrdersStatus.success,
          recentOrdersList: recentOrder,
          completedOrdersList: completedOrder,
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

  Timer? _timer;
  void startTimer() {
    logger.d('startTimer');
    _timer?.cancel();
    Duration oneSec = const Duration(seconds: 1);
    emit(state.copyWith(orderTimerDuration: const Duration(minutes: 5)));
    _timer = Timer.periodic(oneSec, (timer) {
      if (state.orderTimerDuration == Duration.zero) {
        timer.cancel();
      } else {
        emit(
          state.copyWith(
            orderTimerDuration: state.orderTimerDuration! - oneSec,
          ),
        );
      }
    });
  }

  void cancelTimer() {
    logger.d('cancelTimer');
    _timer?.cancel();
  }

  disposeControllers() {
    codeController.dispose();
    notesController.dispose();
    messageController.dispose();
  }

  @override
  Future<void> close() {
    cancelTimer();
    disposeControllers();
    return super.close();
  }

  void setDiscountCode(String value) {
    logger.d(value);
  }
}
