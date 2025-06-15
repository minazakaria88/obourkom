import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class LocationListviewItem extends StatelessWidget {
  const LocationListviewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
           BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: AppColors.shadowColor.withAlpha((0.3*255).toInt()),
            offset: const Offset(0, 1)
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: AppColors.mainColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesProfileHome),
                  5.width,
                  Text(S.of(context).home,style: AppTextStyles.regular12Grey.copyWith(fontSize: 16),)

                ],
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  S.of(context).main,
                  style: AppTextStyles.regular12Grey.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.imagesEdit),
                    5.width,
                    Text(S.of(context).edit,style: AppTextStyles.regular12Grey,)
                  ],
                ),
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.imagesDelete),
                    5.width,
                    Text(S.of(context).delete,style: AppTextStyles.regular12Grey,)
                  ],
                ),
              ),
            ],
          ),
          30.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).location,
                style: AppTextStyles.regular12Grey,
              ),
              20.width,
              Flexible(
                child: Text(
                  'PM8G+HVJ حي الورد، الأمير فيصل بن سعد بن عبدالرحمن، الورود، الرياض 12251، المملكة العربية السعودية',
                  style: AppTextStyles.regular12Grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
