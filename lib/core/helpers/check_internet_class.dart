import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:oborkom/main.dart';

import '../routes/routes.dart';

class CheckInternetClass {
  static bool isPushed = false;
  static StreamSubscription<List<ConnectivityResult>>? subscription;

  static void checkInternetStream() {
    subscription?.cancel();
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      if (NavigatorClass.navigatorKey.currentState!.mounted) {
        handleConnectivityChange(event);
      }
    });
  }

  static void handleConnectivityChange(List<ConnectivityResult> event) {
    if (event.contains(ConnectivityResult.none)) {
      if (!isPushed) {
        isPushed = true;
        if (NavigatorClass.navigatorKey.currentState!.mounted) {
          NavigatorClass.navigatorKey.currentState!.pushNamed(
            Routes.noInternet,
          );
        }
      }
    } else {
      if (isPushed) {
        isPushed = false;
        if (NavigatorClass.navigatorKey.currentState!.mounted) {
          NavigatorClass.navigatorKey.currentState!.pop();
        }
      }
    }
  }

  static void dispose() {
    subscription?.cancel();
  }
}
