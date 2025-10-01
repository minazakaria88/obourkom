import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/profile_image.dart';
import '../../../data/models/order_model.dart';

class CompleteOrderDriverWidget extends StatelessWidget {
  const CompleteOrderDriverWidget({
    super.key,
    required this.driver,
    required this.driverRate,
  });
  final Driver driver;
  final String driverRate;
  @override
  Widget build(BuildContext context) {
    return BackgroundProfileWidget(
      child: Row(
        children: [
          const ProfileImage(),
          20.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(driver.name ?? '', style: AppTextStyles.bold18Black),
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesStars),
                  5.width,
                  Text(driverRate, style: AppTextStyles.bold18Black),
                ],
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
