import 'package:dio/dio.dart';
import 'package:oborkom/core/network/api_helper.dart';
import 'package:oborkom/core/network/end_point.dart';
import 'package:oborkom/core/network/failure.dart';
import 'package:oborkom/core/utils/constant.dart';

class LoginRepository {
  final ApiHelper apiHelper;

  LoginRepository({required this.apiHelper});

  Future login({required String phoneNumber}) async {
      await apiHelper.postData(
        url: EndPoints.login,
        data: {'phone': phoneNumber},
      );
  }
}
