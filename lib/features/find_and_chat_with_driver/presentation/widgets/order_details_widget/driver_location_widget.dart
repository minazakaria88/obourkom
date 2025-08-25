import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/functions/make_phone_call.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/profile_image.dart';
import 'call_and_show_on_map_widget.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(10),
        onExpansionChanged: (value) {},
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        title: Row(
          children: [
            const ProfileImage(width: 40, height: 40),
            20.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('', style: AppTextStyles.bold18Black),
                Row(
                  children: [
                    SvgPicture.asset(Assets.imagesStars),
                    5.width,
                    Text('4.5', style: AppTextStyles.bold18Black),
                  ],
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                makePhoneCall(phoneNumber: '');
              },
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.greenColor,
                ),
                child: SvgPicture.asset(Assets.imagesPhoneCalling),
              ),
            ),
            10.width,
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.darkMainColor,
                ),
                child: SvgPicture.asset(Assets.imagesCompassBig),
              ),
            ),
          ],
        ),
        children: [
          const Divider(color: AppColors.greyColor, thickness: 2),
          20.height,
          Row(
            children: [
              SvgPicture.asset(Assets.imagesCar),
              10.width,
              Text('شيفروليه 2022 - ابيض', style: AppTextStyles.bold18Black),
            ],
          ),
          20.height,
          const CallAndShowOnMapWidget(),
        ],
      ),
    );
  }
}

