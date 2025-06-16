import 'package:dio/dio.dart';
import 'package:oborkom/core/api/api_helper.dart';
import 'package:oborkom/core/api/end_point.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/features/notification/data/models/notification_model.dart';

class NotificationRepository {
  final ApiHelper apiHelper;

  NotificationRepository({required this.apiHelper});

  Future<List<NotificationModel>> getNotification() async {
    List<NotificationModel> notifications = [];
    try {
      final response = await apiHelper.getData(url: EndPoints.notification);
      response.data.forEach((e) {
        notifications.add(NotificationModel.fromJson(e));
      });
      return notifications;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(message: e.toString()));
    }
  }



}
