part of 'find_and_chat_with_driver_cubit.dart';

enum UploadPickImageStatus{loading,success,failure}

enum UploadDeliveryImageStatus{loading,success,failure}


class FindAndChatWithDriverState extends Equatable {
  Duration? orderTimerDuration;
  List<OfferModel>? offers;
  List<MessageModel>? messages;
  String? errorMessage;
  String ? orderStatus;
  UploadDeliveryImageStatus ?uploadDeliveryImageStatus;
  UploadPickImageStatus? uploadPickImageStatus;

  FindAndChatWithDriverState({
    this.orderTimerDuration,
    this.offers,
    this.messages,
    this.errorMessage,
    this.orderStatus,
    this.uploadPickImageStatus,
    this.uploadDeliveryImageStatus
  });

  FindAndChatWithDriverState copyWith({
    Duration? orderTimerDuration,
    List<OfferModel>? offers,
    List<MessageModel>? messages,
    String? errorMessage,
    String? orderStatus,
    UploadDeliveryImageStatus ?uploadDeliveryImageStatus,
    UploadPickImageStatus? uploadPickImageStatus,
  }) {
    return FindAndChatWithDriverState(
      orderTimerDuration: orderTimerDuration ?? this.orderTimerDuration,
      offers: offers ?? this.offers,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
      orderStatus: orderStatus ?? this.orderStatus,
      uploadDeliveryImageStatus: uploadDeliveryImageStatus ?? this.uploadDeliveryImageStatus,
      uploadPickImageStatus: uploadPickImageStatus ?? this.uploadPickImageStatus
    );
  }

  @override
  List<Object?> get props => [
    orderTimerDuration,
    offers,
    messages,
    errorMessage,
    orderStatus,
    uploadPickImageStatus,
    uploadDeliveryImageStatus
  ];
}
