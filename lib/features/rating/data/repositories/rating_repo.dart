import 'package:dio/dio.dart';

import '../../../../core/api/api_helper.dart';
import '../../../../core/api/end_point.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/utils/constant.dart';

class RatingRepository {
  final ApiHelper apiHelper;
  RatingRepository({required this.apiHelper});
  Future<void> rateDriver({required String orderId,dynamic data}) async {
    try {
     final response =  await apiHelper.postData(
        url: '${EndPoints.orders}/$orderId/${EndPoints.rateDriver}',
        data: data,
      );
     logger.d(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
