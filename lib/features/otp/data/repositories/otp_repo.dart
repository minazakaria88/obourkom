import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';

class OtpRepository {
  final ApiHelper apiHelper;

  OtpRepository({required this.apiHelper});

  Future<bool> verifyOtp({
    required String otp,
    required String phoneNumber,
  }) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.verifyOtp,
        data: {'phoneNUmber': phoneNumber, 'otp': otp},
      );
      return response.data['status'];
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<bool> resendOtp({
    required String phoneNumber,
  }) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.resendOtp,
        data: {'phoneNUmber': phoneNumber,},
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
