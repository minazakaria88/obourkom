import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/cached_image_widget.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return BackgroundProfileWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.bold18Black.copyWith(
                color: AppColors.mainColor,
              ),
            ),
            10.height,
            SizedBox(
                width: double.infinity,
                height: 200,
                child: CachedImageWidget(imageUrl: image))

          ],
        ),
      ),
    );
  }
}
