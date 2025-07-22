import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/message_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';
import '../../../../core/api/api_helper.dart';

class FindAndChatWithDriverRepository {
  final ApiHelper apiHelper;

  FindAndChatWithDriverRepository({required this.apiHelper});

  final firestore = FirebaseFirestore.instance.collection('orders');

  Stream<List<OfferModel>> getOffersForOrder({required String orderId}) {
    return firestore
        .doc(orderId)
        .collection('offers')
        .snapshots()
        .map(
          (event) =>
              event.docs.map((e) => OfferModel.fromJson(e.data())).toList(),
        );
  }

  Stream<List<MessageModel>> getMessages({
    required String orderId,
    required String driverId,
  }) {
    return firestore
        .doc(orderId)
        .collection('chats')
        .doc(driverId)
        .collection('messages')
        .snapshots()
        .map(
          (event) =>
              event.docs.map((e) => MessageModel.fromJson(e.data())).toList(),
        );
  }

  Future<void> sendMessage({
    required String orderId,
    required String driverId,
    required MessageModel message,
  }) async {
    await firestore
        .doc(orderId)
        .collection('chats')
        .doc(driverId)
        .collection('messages')
        .add(message.toJson());
  }

  Stream<String> getOrderStatus({required String orderId}) {
    return firestore.doc(orderId).snapshots().map((event) => event['status']);
  }
}
