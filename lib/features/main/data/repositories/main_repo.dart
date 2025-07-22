import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/features/main/data/models/car_model.dart';
import 'package:oborkom/features/main/data/models/categories_model.dart';
import 'package:oborkom/features/main/data/models/slider_model.dart';

import '../../../../core/api/end_point.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/utils/constant.dart';

class MainRepository {
  final ApiHelper apiHelper;
  MainRepository({required this.apiHelper});

  Future<CategoriesModel> getCategories() async {
    try {
      final response = await apiHelper.getData(url: EndPoints.categories);
      logger.d(response.data);
      return CategoriesModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<SliderModel> getSlider() async {
    try {
      final response = await apiHelper.getData(url: EndPoints.slider);
      logger.d(response.data);
      return SliderModel.fromJson(response.data);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<List<CarModel>> getCars(List<String> ids) async {
    List<CarModel> cars = [];
    try {
      final future =ids.map((e) => apiHelper.getData(url: '${EndPoints.trucks}/$e')).toList();
      final responses = await Future.wait(future);
      for (var element in responses) {
        logger.i(element);
        cars.add(CarModel.fromJson(element.data['data']));
      }
      return cars;
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
