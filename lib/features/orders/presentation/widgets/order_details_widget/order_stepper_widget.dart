import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';


class OrderStepperWidget extends StatelessWidget {
  const OrderStepperWidget({
    super.key, required this.title, required this.image,
  });
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.mainColor,
          ),
          child: SvgPicture.asset(image),
        ),
        SizedBox(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular12Grey,
          ),
        ),
      ],
    );
  }
}
