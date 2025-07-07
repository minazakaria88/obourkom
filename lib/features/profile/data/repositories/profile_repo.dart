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

  Future<UserModel> updateProfile(data) async {
    try {
      final response = await apiHelper.putData(url: EndPoints.profile, data: data);
      return UserModel.fromJson(response.data);
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
