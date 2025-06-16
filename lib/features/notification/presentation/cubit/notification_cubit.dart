import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/features/notification/data/models/notification_model.dart';
import 'package:oborkom/features/notification/data/repositories/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({required this.notificationRepository})
    : super(NotificationState());

  final NotificationRepository notificationRepository;

  void getNotification() async {
    try {
      emit(state.copyWith(notificationStatus: NotificationStatus.loading));
      // final result = await notificationRepository.getNotification();
      await Future.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          notificationStatus: NotificationStatus.success,
          notifications: [
            NotificationModel('title', 'description', 1, false, 'dateTime'),
            NotificationModel('title', 'mina is the best flutter developer', 1, true, 'dateTime'),],
        ),
      );
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          notificationStatus: NotificationStatus.error,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          notificationStatus: NotificationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
