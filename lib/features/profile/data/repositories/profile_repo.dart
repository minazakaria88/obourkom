import 'package:dio/dio.dart';
import 'package:oborkom/core/api/end_point.dart';
import '../../../../core/api/api_helper.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/utils/constant.dart';
import '../../../otp/data/models/user_model.dart';
import '../models/faq_model.dart';

class ProfileRepository {
  final ApiHelper apiHelper;
  ProfileRepository({required this.apiHelper});
  Future<User> getUser() async {
    try {
      final response = await apiHelper.getData(url: EndPoints.profile);
      logger.d(response.data);
       return User.fromJson(response.data['data']);
    } catch (e) {
      logger.e(e);
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<User> updateProfile(data) async {
    try {
      final response = await apiHelper.postData(url: EndPoints.updateProfile, data: data);
      return User.fromJson(response.data['data']);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

  Future<FaqModel> getFaq() async {
    try {
      final response = await apiHelper.getData(url: EndPoints.faq);
      return FaqModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }
}
