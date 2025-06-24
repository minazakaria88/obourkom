import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_styles.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';

class ErrorAppWidget extends StatelessWidget {
  const ErrorAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50, width: double.infinity),
        Image.asset(
          Assets.imagesError,
          fit: BoxFit.fill,
          height: 200,
          width: 200,
        ),
        20.height,
        Text(
          S.of(context).somethingWentWrong,
          style: AppTextStyles.bold18Black,
        ),
      ],
    );
  }
}
