part of 'notification_cubit.dart';

enum NotificationStatus { loading, success, error }

extension NotificationStatusX on NotificationState {
  bool get isLoading => notificationStatus == NotificationStatus.loading;
  bool get isError => notificationStatus == NotificationStatus.error;
  bool get isSuccess => notificationStatus == NotificationStatus.success;
}

class NotificationState extends Equatable {
  NotificationStatus? notificationStatus;
  List<DataNotificationModel>? notifications;
  String? errorMessage;

  NotificationState({
    this.notificationStatus,
    this.notifications,
    this.errorMessage,
  });

  NotificationState copyWith({
    NotificationStatus? notificationStatus,
    List<DataNotificationModel>? notifications,
    String? errorMessage,
  }) {
    return NotificationState(
      notifications: notifications ?? this.notifications,
      notificationStatus: notificationStatus ?? this.notificationStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [notificationStatus, notifications, errorMessage];
}
