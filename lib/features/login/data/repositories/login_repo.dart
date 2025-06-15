import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';

class LoginRepository {
  final ApiHelper apiHelper;

  LoginRepository({required this.apiHelper});

  Future<bool> login({required String phoneNumber}) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.login,
        data: {'phone': phoneNumber},
      );
      log(response.data);
      return response.data['status'];
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
