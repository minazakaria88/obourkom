import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';
import '../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundProfileWidget(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تم تحديث التطبيق!',
                      style: AppTextStyles.bold18Black.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.imagesCloseCircle,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greyColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                15.height,
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.imagesGreenDot,
                      colorFilter: const ColorFilter.mode(
                        AppColors.greyColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    10.width,
                    Flexible(
                      child: Text(
                        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى',
                        style: AppTextStyles.regular12Grey.copyWith(height: 2),
                      ),
                    ),
                  ],
                ),
                15.height,
                Text(
                  '12:00 pm  26 feb 2024',
                  style: AppTextStyles.regular12Grey,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),

              color: AppColors.greyColor.withAlpha(40),
            ),
          ),
        ),
      ],
    );
  }
}
