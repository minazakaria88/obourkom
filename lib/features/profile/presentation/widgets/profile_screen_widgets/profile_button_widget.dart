import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    super.key, required this.title, required this.image, required this.onTap, this.trailing,
  });
  final String title;
  final String image;
  final Function onTap;
  final Widget ? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.regular16Black,
      ),
      leading: SvgPicture.asset(image),
      trailing:trailing ?? const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.mainColor,
        size: 20,
      ),
      onTap: (){
        onTap();
      },
    );
  }
}
