import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/otp/data/models/user_model.dart';

class OtpRepository {
  final ApiHelper apiHelper;

  OtpRepository({required this.apiHelper});

  Future<UserModel> verifyOtp({
    required String otp,
    required OtpType otpType,
  }) async {
    try {
      final response = await apiHelper.postData(
        url: otpType == OtpType.login
            ? EndPoints.verifyOtp
            : EndPoints.verifyOtpRegister,
        data: {'code': otp},
      );
      logger.i(response.data);
      return UserModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future resendOtp({
    required String phoneNumber,
    required OtpType otpType,
  }) async {
    logger.i(phoneNumber);
    try {
      final response = await apiHelper.postData(
        url: otpType == OtpType.login
            ? EndPoints.resendOtp
            : EndPoints.resendOtpRegister,
        data: {'phone': phoneNumber},
      );
      logger.i(response.data);
      return response.data;
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
