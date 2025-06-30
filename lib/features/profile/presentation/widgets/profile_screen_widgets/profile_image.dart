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
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width ?? 80,
      height: height ?? 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: AppColors.mainColor),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: image != null
              ? NetworkImage(image!)
              : const AssetImage(Assets.imagesLogo),
        ),
      ),

      // child: image != null
      //     ? Image.network(image!,fit: BoxFit.fill,)
      //     : Image.asset(Assets.imagesLogo),
    );
  }
}
