import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/message_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
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
    logger.d('${EndPoints.orders}/$orderId/offers/$driverId/chat');
    return firestore
        .doc(orderId)
        .collection('chat')
        .doc(driverId)
        .collection('messages')
        .orderBy('created_at')
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
    // await apiHelper.postData(
    //   url: '${EndPoints.orders}/$orderId/offers/$driverId/chat',
    //   data: message.toJson(),
    // );
    await firestore
        .doc(orderId)
        .collection('chat')
        .doc(driverId)
        .collection('messages')
        .add(message.toJson());
  }

  Stream<String> getOrderStatus({required String orderId}) {
    return firestore.doc(orderId).snapshots().map((event) => event['status']);
  }

  Future<OrderDataModel> getOrderData({required String orderId}) async {
    final response = await firestore.doc(orderId).get();
    logger.i(response);
    if (response.exists) {
      return OrderDataModel.fromJson(response.data()!);
    } else {
      throw Exception('no orders');
    }
  }

  Future<void> cancelOrder({required String orderId}) async {
    try {
      await apiHelper.deleteData(url: EndPoints.cancelOrder);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<void> acceptOffer({
    required String orderId,
    required String offerId,
  }) async {
    try {
      logger.d('${EndPoints.orders}/$orderId/offers/$offerId/accept');
      final response = await apiHelper.postData(
        url: '${EndPoints.orders}/$orderId/offers/$offerId/accept',
        data: {},
      );
      logger.d(response.data);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
