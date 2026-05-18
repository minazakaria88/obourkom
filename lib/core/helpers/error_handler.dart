import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/constant.dart';



void registerErrorHandler() {

  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (final FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    logger.i(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError =
      (final Object error, final StackTrace stack) {
    logger.e(error.toString());
    // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (final FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}



