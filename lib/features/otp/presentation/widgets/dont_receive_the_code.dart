import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class DontReceiveTheCodeWidget extends StatelessWidget {
  const DontReceiveTheCodeWidget({
    super.key, required this.onTap,
  });
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontReceiveTheCode,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        10.width,
        TextButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            S.of(context).resend,
            style: const TextStyle(
              color: AppColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
