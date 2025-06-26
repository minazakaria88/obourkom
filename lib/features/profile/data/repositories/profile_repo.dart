import 'package:dio/dio.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/features/profile/data/models/user_model.dart';

import '../../../../core/api/api_helper.dart';
import '../../../../core/api/failure.dart';
import '../models/faq_model.dart';

class ProfileRepository {
  final ApiHelper apiHelper;
  ProfileRepository({required this.apiHelper});
  Future<UserModel> getUser() async {
    try {
      // final response = await apiHelper.getData(url: EndPoints.profile);
      // return UserModel.fromJson(response.data);
      await Future.delayed(const Duration(seconds: 2));
      return UserModel(
        name: 'mina',
        email: 'minazakaria264@gmail.com',
        phone: '558412655',
      );
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<bool> updateProfile(data) async {
    try {
      // final response = await apiHelper.putData(url: EndPoints.profile, data: data);
      // return UserModel.fromJson(response.data);
      await Future.delayed(const Duration(seconds: 2));
      return true;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<List<FaqModel>> getFaq() async {
    List<FaqModel> faq = [];
    try {
      final response = await apiHelper.getData(url: EndPoints.faq);
      response.data.forEach((element) {
        faq.add(FaqModel.fromJson(element));
      });
      return faq;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
