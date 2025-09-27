import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../utils/constant.dart';

class NotificationService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;
  static final localNotification = FlutterLocalNotificationsPlugin();
  static Future<void> init() async {

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    InitializationSettings initializationSettings =
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
          ),
        );

    await localNotification.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        //handle when the user press on the notification
      },
    );


    //request ios location permission
    await localNotification
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    // request android location permission
    await localNotification
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    getToken();

    handleBackgroundMessage();

    handleForegroundMessage();

    logger.i('Authorization status: ${settings.authorizationStatus}');
  }

  static void getToken() async {
    String? token = await messaging.getToken();
    logger.i('Token: $token');
  }

  static handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showLocalNotification(
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        payload: message.data['route'] ?? '',
      );
    });
  }

  static Future<void> handleMessage(RemoteMessage message) async {
    logger.i('🔔 Title: ${message.notification?.title}');
    logger.i('📩 Body: ${message.notification?.body}');
    logger.i('📦 Data: ${message.data}');


    //handle when the user press on the notification
  }

  static Future<void> handleBackgroundMessage() async {
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    final message = await messaging.getInitialMessage();
    if (message != null) {
      await handleMessage(message);
    }
  }

  static int id = 0;

 static void showLocalNotification({
    required String title,
    required String body,
    required String payload,
  }) {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    localNotification.show(
      id++,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
