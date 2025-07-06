import 'package:cached_network_image/cached_network_image.dart';
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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: AppColors.mainColor),
      ),
      child: image != null
          ? Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: width ?? 80,
              height: height ?? 80,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CachedNetworkImage(imageUrl: image!, fit: BoxFit.fill),
            )
          : Image.asset(Assets.imagesLogo),
    );
  }
}
