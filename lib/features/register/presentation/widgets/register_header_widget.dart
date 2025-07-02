
import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_styles.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Image.asset(Assets.imagesLogo),
        15.height,
        Text(
          S.of(context).createAccount,
          style: AppTextStyles.bold24Black,
        ),
        15.height,
        Text(
          S.of(context).registerWithUs,
          textAlign: TextAlign.center,
          style: AppTextStyles.regular16Black,
        ),
      ],
    );
  }
}
