import 'package:firebase_messaging/firebase_messaging.dart';

import '../utils/constant.dart';

class NotificationService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

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
      logger.i('🔔 Title: ${message.notification?.title}');
      logger.i('📩 Body: ${message.notification?.body}');
      logger.i('📦 Data: ${message.data}');
    });
  }

  static Future<void> handleMessage(RemoteMessage message) async {
    logger.i('🔔 Title: ${message.notification?.title}');
    logger.i('📩 Body: ${message.notification?.body}');
    logger.i('📦 Data: ${message.data}');
  }

  static Future<void> handleBackgroundMessage() async {
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    final message = await messaging.getInitialMessage();
    if (message != null) {
      await handleMessage(message);
    }
  }
}
