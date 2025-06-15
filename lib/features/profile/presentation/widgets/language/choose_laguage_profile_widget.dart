import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../language/data/models/profile_language_model.dart';

class ChooseLanguageProfileWidget extends StatelessWidget {
  const ChooseLanguageProfileWidget({
    super.key,
    required this.profileLanguages, required this.onTap,
  });

  final ProfileLanguageModel profileLanguages;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: profileLanguages.isSelected
                ? AppColors.lightGreen
                : AppColors.greyColor,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(profileLanguages.image),
            20.width,
            Expanded(
              child: Text(
                profileLanguages.name,
                style: AppTextStyles.bold18Black,
              ),
            ),
            if (profileLanguages.isSelected) SvgPicture.asset(Assets.imagesRadio),
            20.width,
          ],
        ),
      ),
    );
  }
}
