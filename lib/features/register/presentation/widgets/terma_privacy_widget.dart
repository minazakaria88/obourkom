import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class SignUpPolicyText extends StatelessWidget {
  const SignUpPolicyText({super.key, required this.isAccept});

  final ValueNotifier<bool> isAccept;

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        if (!isAccept.value) {
          return S.of(context).pleaseAcceptTheTermsAndConditions;
        }
        return null;
      },
      builder:(field) =>  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: isAccept,
                builder: (context, value, child) => Checkbox(
                  activeColor: AppColors.mainColor,
                  value: isAccept.value,
                  onChanged: (value) {
                    isAccept.value = value!;
                  },
                ),
              ),
              5.width,
              Flexible(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).iAgreeToThe,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: S.of(context).TermsAndConditions,
                        style: const TextStyle(
                          color: AppColors.mainColor,
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: S.of(context).and,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: S.of(context).PrivacyPolicy,
                        style: const TextStyle(
                          color: AppColors.mainColor,
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (field.errorText != null)
            Text(
              field.errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
