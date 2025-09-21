import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import 'package:oborkom/features/orders/data/models/submit_order_model.dart';

import '../../../../core/api/end_point.dart';
import '../../../../core/api/failure.dart';

class OrderRepository {
  final ApiHelper apiHelper;
  OrderRepository({required this.apiHelper});

  Future<SubmitOrderModel> makeOrder(data) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.orders,
        data: data,
      );
      logger.d(response.data);
      return SubmitOrderModel.fromJson(response.data['data']);
    } catch (e) {
      if (e is DioException) {
        logger.e(e.response?.statusCode?? '');
        logger.e(e.response?.data?? '');
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<OrderModel> getOrders(int page) async {
    try {
      final response = await apiHelper.getData(url: EndPoints.orders,queryParameters:{
        'page': page,
      });
      logger.d(response.data);
      return OrderModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<bool> cancelOrder(data) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.cancelOrder,
        data: data,
      );
      return response.data['status'];
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }


}
