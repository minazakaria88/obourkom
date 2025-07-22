import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/message_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/repositories/find_and_chat_repo.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/constant.dart';
part 'find_and_chat_with_driver_state.dart';

class FindAndChatWithDriverCubit extends Cubit<FindAndChatWithDriverState> {
  FindAndChatWithDriverCubit({required this.findAndChatWithDriverRepository})
    : super(
        FindAndChatWithDriverState(
          orderTimerDuration: const Duration(minutes: 5),
        ),
      );

  final FindAndChatWithDriverRepository findAndChatWithDriverRepository;

  Timer? _timer;

  TextEditingController messageController = TextEditingController();
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

  StreamSubscription? offerStream;
  void listenForOffers({required String orderId}) async {
    try {
      offerStream?.cancel();
      offerStream = findAndChatWithDriverRepository
          .getOffersForOrder(orderId: orderId)
          .listen((offers) {
            emit(state.copyWith(offers: offers));
          });
      logger.d(state.offers);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  StreamSubscription? messageStream;
  void listenForMessages({required String driverId, required String orderId}) {
    try {
      messageStream?.cancel();
      messageStream = findAndChatWithDriverRepository
          .getMessages(orderId: orderId, driverId: driverId)
          .listen((messages) {
            emit(state.copyWith(messages: messages));
          });
      logger.d(state.messages);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void sendMessage({
    required String driverId,
    required String orderId,
    required String message,
  }) async {
    final String? customerId = await CacheHelper.getData(
      key: CacheHelperKeys.customerId,
    );
    MessageModel messageModel = MessageModel(
      message: message,
      dateTime: DateTime.now(),
      senderId: customerId,
      receiverId: driverId,
    );
    logger.d(messageModel);
    await findAndChatWithDriverRepository.sendMessage(
      driverId: driverId,
      orderId: orderId,
      message: messageModel,
    );
    messageController.clear();
  }

  StreamSubscription? orderStatusStream;
  void listenForOrderStatus({required String orderId}) {
    try {
      orderStatusStream?.cancel();
      orderStatusStream = findAndChatWithDriverRepository
          .getOrderStatus(orderId: orderId)
          .listen((status) {
            emit(state.copyWith(orderStatus: status));
          });
      logger.d(state.orderStatus);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    cancelTimer();
    offerStream?.cancel();
    messageStream?.cancel();
    orderStatusStream?.cancel();
    messageController.dispose();
    return super.close();
  }
}
