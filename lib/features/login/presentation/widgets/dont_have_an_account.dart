import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/routes/routes.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAccount,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        10.width,
        TextButton(
          onPressed: () {
             context.pushNamed(Routes.register);
          },
          child: Text(
            S.of(context).createAccount,
            style: const TextStyle(
              color: AppColors.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
