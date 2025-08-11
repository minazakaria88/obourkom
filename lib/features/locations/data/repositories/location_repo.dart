import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';

import '../../../../core/utils/constant.dart';
import '../models/location_model.dart';

class LocationRepository {
  final ApiHelper apiHelper;

  LocationRepository({required this.apiHelper});

  Future<List<LocationModel>> getLocations() async {
    final List<LocationModel> locations = [];
    try {
      final response = await apiHelper.getData(url: EndPoints.addresses);
      response.data.forEach((e) {
        locations.add(LocationModel.fromJson(e));
      });
      logger.d(response.data);
      return locations;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<void> postAddresses(LocationModel model) async {
    try {

      final response = await apiHelper.postData(url: EndPoints.addresses, data: model.toJson());
      logger.d(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<void> deleteAddress(int id) async {
    try {
      await apiHelper.deleteData(url: '${EndPoints.addresses}/$id');
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
  Future<void> updateAddresses(LocationModel model) async {
    try {
      await apiHelper.putData(url: EndPoints.addresses, data: model.toJson());
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }




}
