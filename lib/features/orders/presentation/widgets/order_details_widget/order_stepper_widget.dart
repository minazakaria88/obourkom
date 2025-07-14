import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class OrderStepperWidget extends StatelessWidget {
  const OrderStepperWidget({
    super.key,
    required this.title,
    required this.image,
    required this.isActive,
  });
  final String title;
  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isActive ? AppColors.mainColor : Colors.white,
            border: !isActive
                ? Border.all(width: 1, color: AppColors.greyColor)
                : null,
          ),
          child: SvgPicture.asset(
            image,
            colorFilter: !isActive
                ? const ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn)
                : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        10.height,
        SizedBox(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: !isActive
                ? AppTextStyles.regular12Grey
                : AppTextStyles.bold18Black.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
