import 'package:dio/dio.dart';

import '../../../../core/api/api_helper.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/api/failure.dart';

class RatingRepository {
  final ApiHelper apiHelper;
  RatingRepository({required this.apiHelper});
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