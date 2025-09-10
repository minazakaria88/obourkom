import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/features/notification/data/models/notification_model.dart';

import '../../../../core/utils/constant.dart';

class NotificationRepository {
  final ApiHelper apiHelper;

  NotificationRepository({required this.apiHelper});

  Future<NotificationModel> getNotification() async {
    try {
      final response = await apiHelper.getData(url: EndPoints.notification);
      logger.i(response);
      return NotificationModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }


  Future<void> markNotificationAsRead(String id) async {
    try {
      await apiHelper.postData(url: '${EndPoints.seenNotifications}/$id');
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }




}
