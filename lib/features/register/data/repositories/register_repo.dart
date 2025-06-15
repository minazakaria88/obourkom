import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';

class RegisterRepository {
  final ApiHelper apiHelper;

  RegisterRepository({required this.apiHelper});

  Future<bool> register(data) async {
    try {
      final response = await apiHelper.postData(
        url: EndPoints.register,
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
