import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';

import '../models/location_model.dart';

class LocationRepository {
  final ApiHelper apiHelper;

  LocationRepository({required this.apiHelper});

  Future<List<LocationModel>> getLocations() async {
    final List<LocationModel> locations = [];
    try {
      final response = await apiHelper.getData(url: EndPoints.login);
      response.data.forEach((e) {
        locations.add(LocationModel.fromJson(e));
      });
      return locations;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
