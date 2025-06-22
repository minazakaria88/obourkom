import 'package:flutter/material.dart';
import 'package:oborkom/core/utils/app_styles.dart';

class ErrorHandler {
  static void handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(CustomErrorWidget(error: details.exception.toString()));
  }
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Something went wrong', style: AppTextStyles.bold18Black),
                const SizedBox(height: 100),
                Text(
                  error ?? '',
                  style: AppTextStyles.bold18Black,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
