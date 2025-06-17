import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/functions/get_places_mark.dart';
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

  void pickDeliveryLocation(LatLng position) async {
    final locationData = await getAddressFromLatAndLng(position);
    emit(
      state.copyWith(
        deliveryLocation: LatLng(position.latitude, position.longitude),
        deliveryLocationData: locationData.first,
      ),
    );
  }

  void pickPickupLocation(LatLng position) async {
    final locationData = await getAddressFromLatAndLng(position);
    emit(
      state.copyWith(
        pickedLocation: LatLng(position.latitude, position.longitude),
        pickedLocationData: locationData.first,
      ),
    );
  }

  void pickPaymentMethod(String applePay) {
    emit(state.copyWith(paymentMethod: applePay));
  }

  void makeOrder(data) async {
    try {
      emit(state.copyWith(makeOrderStatus: MakeOrderStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      //final result = await otpRepository.makeOrder(data);
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

  void getOrders() async {
    emit(state.copyWith(getOrdersStatus: GetOrdersStatus.loading));
    try {
      final result = await otpRepository.getOrders();
      emit(
        state.copyWith(
          getOrdersStatus: GetOrdersStatus.success,
          ordersList: result,
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
}
