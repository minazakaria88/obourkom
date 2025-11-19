import 'package:dio/dio.dart';
import 'package:oborkom/core/network/end_point.dart';
import 'package:oborkom/features/profile/data/models/about_us_model.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/network/failure.dart';
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
      final response = await apiHelper.postData(
        url: EndPoints.updateProfile,
        data: data,
      );
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

  Future<AboutUsModel> getAboutUs(int page)async
  {
    try {
      final response = await apiHelper.getData(url: '${EndPoints.aboutUs}/$page');
      return AboutUsModel.fromJson(response.data['data']);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }

}
