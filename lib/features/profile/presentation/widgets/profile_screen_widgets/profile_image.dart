import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/assets.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.image, this.width, this.height});
  final String? image;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 80,
      height: height ?? 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: AppColors.mainColor),
      ),
      child: image != null
          ? Image.network(image!)
          : Image.asset(Assets.imagesLogo),
    );
  }
}
