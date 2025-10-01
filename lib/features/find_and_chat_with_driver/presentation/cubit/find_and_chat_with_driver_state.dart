part of 'find_and_chat_with_driver_cubit.dart';

enum UploadPickImageStatus { loading, success, failure }

enum UploadDeliveryImageStatus { loading, success, failure }

enum AcceptOfferStatus { loading, success, failure }

enum RejectOfferStatus { loading, success, failure }

enum ChangeOrderStatus { loading, success, failure }

class FindAndChatWithDriverState extends Equatable {
final  Duration? orderTimerDuration;
final List<OfferModel>? offers;
final List<MessageModel>? messages;
final String? errorMessage;
final  String? orderStatus;
final UploadDeliveryImageStatus? uploadDeliveryImageStatus;
final  UploadPickImageStatus? uploadPickImageStatus;
final  AcceptOfferStatus? acceptOfferStatus;
final  RejectOfferStatus? rejectOfferStatus;
final  String? selectedOfferId;
final  ChangeOrderStatus? changeOrderStatus;
final OfferModel ? selectedOffer;
final FirebaseOfferModel ? offer;

  const FindAndChatWithDriverState({
    this.orderTimerDuration,
    this.offers,
    this.messages,
    this.errorMessage,
    this.orderStatus,
    this.uploadPickImageStatus,
    this.uploadDeliveryImageStatus,
    this.acceptOfferStatus,
    this.selectedOfferId,
    this.rejectOfferStatus,
    this.changeOrderStatus,
    this.selectedOffer,
    this.offer
  });

  FindAndChatWithDriverState copyWith({
    Duration? orderTimerDuration,
    List<OfferModel>? offers,
    List<MessageModel>? messages,
    String? errorMessage,
    String? orderStatus,
    UploadDeliveryImageStatus? uploadDeliveryImageStatus,
    UploadPickImageStatus? uploadPickImageStatus,
    AcceptOfferStatus? acceptOfferStatus,
    String? selectedOfferId,
    RejectOfferStatus? rejectOfferStatus,
    ChangeOrderStatus? changeOrderStatus,
    OfferModel? selectedOffer,
    FirebaseOfferModel? offer
  }) {
    return FindAndChatWithDriverState(
      orderTimerDuration: orderTimerDuration ?? this.orderTimerDuration,
      offers: offers ?? this.offers,
      messages: messages ?? this.messages,
      errorMessage: errorMessage ?? this.errorMessage,
      orderStatus: orderStatus ?? this.orderStatus,
      uploadDeliveryImageStatus:
          uploadDeliveryImageStatus ?? this.uploadDeliveryImageStatus,
      uploadPickImageStatus:
          uploadPickImageStatus ?? this.uploadPickImageStatus,
      acceptOfferStatus: acceptOfferStatus ?? this.acceptOfferStatus,
      selectedOfferId: selectedOfferId ?? this.selectedOfferId,
      rejectOfferStatus: rejectOfferStatus ?? this.rejectOfferStatus,
      changeOrderStatus: changeOrderStatus ?? this.changeOrderStatus,
      selectedOffer: selectedOffer ?? this.selectedOffer,
      offer: offer ?? this.offer
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
    uploadDeliveryImageStatus,
    acceptOfferStatus,
    selectedOfferId,
    rejectOfferStatus,
    changeOrderStatus,
    selectedOffer,
    offer,
  ];
}
