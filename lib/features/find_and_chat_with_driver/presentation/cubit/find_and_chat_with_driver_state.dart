part of 'find_and_chat_with_driver_cubit.dart';

class FindAndChatWithDriverState extends Equatable {
  Duration? orderTimerDuration;
  List<OfferModel>? offers;
  List<MessageModel>? messages;
  String? errorMessage;
  String ? orderStatus;

  FindAndChatWithDriverState({
    this.orderTimerDuration,
    this.offers,
    this.messages,
    this.errorMessage,
    this.orderStatus
  });

  FindAndChatWithDriverState copyWith({
    Duration? orderTimerDuration,
    List<OfferModel>? offers,
    List<MessageModel>? messages,
    String? errorMessage,
    String? orderStatus
  }) {
    return FindAndChatWithDriverState(
      orderTimerDuration: orderTimerDuration ?? this.orderTimerDuration,
      offers: offers ?? this.offers,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
      orderStatus: orderStatus ?? this.orderStatus
    );
  }

  @override
  List<Object?> get props => [
    orderTimerDuration,
    offers,
    messages,
    errorMessage,
    orderStatus
  ];
}
