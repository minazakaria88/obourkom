import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/firebase_offer_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/message_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/repositories/find_and_chat_repo.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/constant.dart';
part 'find_and_chat_with_driver_state.dart';

class FindAndChatWithDriverCubit extends Cubit<FindAndChatWithDriverState> {
  FindAndChatWithDriverCubit({required this.findAndChatWithDriverRepository})
    : super(
        const FindAndChatWithDriverState(
          orderTimerDuration: Duration(minutes: 5),
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
          .listen(
            (offers) {
              if (offers.isNotEmpty) {
                cancelTimer();
              }
              if (offers.isEmpty) {
                startTimer();
              }
              emit(state.copyWith(offers: offers));
            },
            onError: (e) {
              emit(state.copyWith(errorMessage: e.toString()));
            },
          );
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
          .listen(
            (messages) {
              emit(state.copyWith(messages: messages));
            },
            onError: (e) {
              emit(state.copyWith(errorMessage: e.toString()));
            },
          );
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
    final String customerId = CacheHelper.getData(
      key: CacheHelperKeys.customerId,
    ).toString();
    MessageModel messageModel = MessageModel(
      message: message,
      dateTime: DateTime.now(),
      senderId: customerId,
      receiverId: driverId,
    );
    try {
      logger.d(messageModel);
      await findAndChatWithDriverRepository.sendMessage(
        driverId: driverId,
        orderId: orderId,
        message: messageModel,
      );
      messageController.clear();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  StreamSubscription? orderStatusStream;
  void listenForOrderStatus({required String orderId}) {
    try {
      orderStatusStream?.cancel();
      orderStatusStream = findAndChatWithDriverRepository
          .getOrderStatus(orderId: orderId)
          .listen(
            (status) {
              emit(state.copyWith(orderStatus: status));
            },
            onError: (e) {
              emit(state.copyWith(errorMessage: e.toString()));
            },
          );
      logger.d(state.orderStatus);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void assignOffer(OfferModel offer) {
    emit(state.copyWith(selectedOffer: offer));
  }

  Future<void> acceptOffer({
    required String orderId,
    required String offerId,
  }) async {
    try {
      cancelTimer();
      emit(
        state.copyWith(
          acceptOfferStatus: AcceptOfferStatus.loading,
          selectedOfferId: offerId,
        ),
      );
      await findAndChatWithDriverRepository.acceptOffer(
        orderId: orderId,
        offerId: offerId,
      );
      emit(state.copyWith(acceptOfferStatus: AcceptOfferStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.failure.message,
          acceptOfferStatus: AcceptOfferStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          acceptOfferStatus: AcceptOfferStatus.failure,
        ),
      );
    }
  }

  Future<void> rejectOffer({
    required String orderId,
    required String offerId,
  }) async {
    try {
      emit(
        state.copyWith(
          rejectOfferStatus: RejectOfferStatus.loading,
          selectedOfferId: offerId,
        ),
      );
      await findAndChatWithDriverRepository.rejectOffer(
        orderId: orderId,
        offerId: offerId,
      );
      emit(state.copyWith(rejectOfferStatus: RejectOfferStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.failure.message,
          rejectOfferStatus: RejectOfferStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          rejectOfferStatus: RejectOfferStatus.failure,
        ),
      );
    }
  }

  Future<void> changeOrderStatus({
    required String orderId,
    required String status,
  }) async {
    try {
      emit(state.copyWith(changeOrderStatus: ChangeOrderStatus.loading));
      await findAndChatWithDriverRepository.changeOrderStatus(
        orderId: orderId,
        status: status,
      );
      emit(state.copyWith(changeOrderStatus: ChangeOrderStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.failure.message,
          changeOrderStatus: ChangeOrderStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          changeOrderStatus: ChangeOrderStatus.failure,
        ),
      );
    }
  }

  StreamSubscription? acceptOfferStream;
  void listenForMyOffer({required String orderId, required String offerId}) {
    try {
      acceptOfferStream?.cancel();
      acceptOfferStream = findAndChatWithDriverRepository
          .listenForMyOffer(orderId, offerId)
          .listen(
            (data) {
          emit(state.copyWith(offer: data));
        },
        onError: (e) {
          state.copyWith(errorMessage: e.toString());
        },
      );
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
    acceptOfferStream?.cancel();
    return super.close();
  }
}
