import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/functions/make_phone_call.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/routes/routes.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class CallAndShowOnMapWidget extends StatelessWidget {
  const CallAndShowOnMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              makePhoneCall(phoneNumber: '');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.greenColor.withAlpha(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.imagesPhoneCalling,
                    colorFilter: const ColorFilter.mode(
                      AppColors.greenColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  10.width,
                  Text(
                    S.of(context).call,
                    style: AppTextStyles.bold14Grey.copyWith(
                      color: AppColors.greenColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        10.width,
        Expanded(
          child: InkWell(
            onTap: () {
              context.pushNamed(Routes.driverLocationScreen);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.darkMainColor.withAlpha(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SvgPicture.asset(
                      Assets.imagesCompassBig,
                      colorFilter: const ColorFilter.mode(
                        AppColors.darkMainColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  10.width,
                  Text(
                    S.of(context).showOnMap,
                    style: AppTextStyles.bold14Grey.copyWith(
                      color: AppColors.darkMainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
