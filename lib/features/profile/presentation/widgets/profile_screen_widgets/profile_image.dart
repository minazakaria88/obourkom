import 'package:flutter/material.dart';
import 'package:oborkom/core/widgets/cached_image_widget.dart';

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
      padding: const EdgeInsets.all(2),
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
              child: CachedImageWidget(imageUrl: image!),
            )
          : Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: width ?? 80,
              height: height ?? 80,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(Assets.imagesLogo),
            ),
    );
  }
}
