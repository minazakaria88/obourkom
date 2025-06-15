import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffE8FFFE).withAlpha(100),
            ),
            child: SvgPicture.asset(Assets.imagesLogout),
          ),
          10.height,
          Text(
            S.of(context).logout,
            style: AppTextStyles.bold18Black,
          ),
          20.height,
          Text(
            S.of(context).areYouSureLogout,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular16Black,
          ),
          20.height,
          MyButton(
            title: S.of(context).exit,
            color: AppColors.red,
            onTap: () {
              logout(context);
            },
          ),
          MyButton(
            title: S.of(context).cancel,
            color: AppColors.mainColor,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}


void logout(BuildContext context) {
  CacheHelper.clearData();
  context.pushNamedAndRemoveUntil(Routes.login, (context) => false);
}
