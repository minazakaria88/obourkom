import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/features/main/data/models/car_model.dart';
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

  Future<List<String>> getSlider() async {
    List<String> slider = [];
    try {
      final response = await apiHelper.getData(url: EndPoints.slider);
      response.data.forEach((e) {
        slider.add(e['image']);
      });
      return slider;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<List<CarModel>> getCars() async {
    List<CarModel> cars = [];
    try {
      final response = await apiHelper.getData(url: EndPoints.cars);
      response.data.forEach((e) {
        cars.add(CarModel.fromJson(e));
      });
      return cars;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
