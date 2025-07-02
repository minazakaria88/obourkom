import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_styles.dart';
import 'package:oborkom/main.dart';

import '../routes/routes.dart';
import '../utils/app_colors.dart';

class ErrorHandler {
  static void handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NavigatorClass.navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (_) =>
              CustomErrorWidget(error: details.exception.toString()),
        ),
      );
    });
  }
}

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              50.height,
              TextButton(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(
                    Routes.home,
                    (route) => false,
                  );
                },
                child: Text(
                  'Go To Home',
                  style: AppTextStyles.bold18Black.copyWith(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
