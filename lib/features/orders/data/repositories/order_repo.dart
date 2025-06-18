import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';

import '../../../../core/api/end_point.dart';
import '../../../../core/api/failure.dart';

class OrderRepository {
  final ApiHelper apiHelper;
  OrderRepository({required this.apiHelper});

  Future makeOrder(data) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.makeOrder,
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

  Future<List<OrderModel>> getOrders() async {
    try {
      final response = await apiHelper.getData(url: EndPoints.getOrders);
      return List<OrderModel>.from(
        response.data.map((x) => OrderModel.fromJson(x)),
      );
    } catch (e) {
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

  Future<bool> rateDriver(data) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.rateDriver,
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
