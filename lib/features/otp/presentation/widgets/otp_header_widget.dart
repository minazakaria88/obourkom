import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/my_back_button.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class OtpHeaderWidget extends StatelessWidget {
  const OtpHeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        60.height,
        const MyBackButton(),
        20.height,
        Image.asset(Assets.imagesOtp),
        20.height,
        Text(
          S.of(context).otp,
          style: AppTextStyles.bold24Black,
        ),
        20.height,
        Text(
          S.of(context).otpText,
          textAlign: TextAlign.center,
          style: AppTextStyles.regular16Black
        ),
        25.height,
      ],
    );
  }
}
