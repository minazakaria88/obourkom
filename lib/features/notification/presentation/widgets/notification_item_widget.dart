import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/notification/data/models/notification_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/constant.dart';
import '../../../../generated/assets.dart';
import '../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({
    super.key,
    required this.notificationModel,
    required this.onTap,
  });

  final DataNotificationModel notificationModel;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final isRead = notificationModel.isRead ?? false;
    logger.i(notificationModel.isRead);
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
                      notificationModel.data?.title ?? '',
                      style: isRead
                          ? AppTextStyles.bold18Black
                          : AppTextStyles.bold18Black.copyWith(
                              color: AppColors.greyColor,
                            ),
                    ),
                    InkWell(
                      onTap: () {
                        onTap();
                      },
                      child: SvgPicture.asset(
                        Assets.imagesCloseCircle,
                        colorFilter: ColorFilter.mode(
                          !isRead ? AppColors.red : AppColors.greyColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                15.height,
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.imagesGreenDot,
                      colorFilter: ColorFilter.mode(
                        !isRead ? AppColors.mainColor : AppColors.greyColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    10.width,
                    Flexible(
                      child: Text(
                        notificationModel.data?.body ?? '',
                        style: !isRead
                            ? AppTextStyles.regular16Black.copyWith(
                                height: 2,
                                fontSize: 12,
                              )
                            : AppTextStyles.regular12Grey.copyWith(height: 2),
                      ),
                    ),
                  ],
                ),
                15.height,
                Text(
                  notificationModel.createdAtFormated ?? '',
                  style: !isRead
                      ? AppTextStyles.regular16Black.copyWith(fontSize: 12)
                      : AppTextStyles.regular12Grey,
                ),
              ],
            ),
          ),
        ),
        if (isRead)
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
