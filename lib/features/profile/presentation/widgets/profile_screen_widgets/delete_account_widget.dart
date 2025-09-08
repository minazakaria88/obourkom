import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/logout_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffFF3B30).withAlpha(40),
              ),
              child: SvgPicture.asset(Assets.imagesDeleteAccount),
            ),
            10.height,
            Text(
              S.of(context).deleteAccount,
              style: AppTextStyles.bold18Black,
            ),
            20.height,
            Text(
              S.of(context).deleteAccountDesc,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular16Black,
            ),
            20.height,
            MyButton(
              title: S.of(context).delete,
              color: AppColors.red,
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}