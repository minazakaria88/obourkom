import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/features/main/data/models/services_model.dart';

import '../../../../core/api/end_point.dart';
import '../../../../core/api/failure.dart';

class MainRepository {
  final ApiHelper apiHelper;
  MainRepository({required this.apiHelper});

  Future<List<ServicesModel>> getService() async {
    List<ServicesModel> services = [];
    try {
      final response = await apiHelper.getData(url: EndPoints.service);
      response.data.forEach((e) {
        services.add(ServicesModel.fromJson(e));
      });
      return services;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
