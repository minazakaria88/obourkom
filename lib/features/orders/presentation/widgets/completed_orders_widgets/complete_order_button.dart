import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_styles.dart';

class CompletedOrderButton extends StatelessWidget {
  const CompletedOrderButton({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
  });
  final String title;
  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          10.width,
          Text(
            title,
            style: AppTextStyles.bold14Grey.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
