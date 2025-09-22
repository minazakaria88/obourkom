import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../generated/l10n.dart';
import '../utils/app_colors.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 90,
              width: double.infinity,
              color: AppColors.mainColor,
              child: Column(
                children: [
                  55.height,
                  Center(
                    child: Text(
                      S.of(context).noInternetConnection,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            100.height,
            // SvgPicture.asset(
            //   colorFilter: const ColorFilter.mode(
            //     AppColors.primaryColor,
            //     BlendMode.srcIn,
            //   ),
            //   Assets.imagesNoInternet,
            //   height: 100,
            //   width: 100,
            //   fit: BoxFit.fill,
            // ),
            30.height,
            Center(
              child: Text(
                S.of(context).pleaseCheckYourInternetConnection,
                style: const TextStyle(color: AppColors.mainColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
