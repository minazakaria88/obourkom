import 'package:dio/dio.dart';
import 'package:oborkom/core/network/api_helper.dart';
import 'package:oborkom/core/network/end_point.dart';
import 'package:oborkom/core/network/failure.dart';
import 'package:oborkom/core/utils/constant.dart';

class RegisterRepository {
  final ApiHelper apiHelper;

  RegisterRepository({required this.apiHelper});

  Future register(data) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.register,
        data: data,
      );
      logger.d(response);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
