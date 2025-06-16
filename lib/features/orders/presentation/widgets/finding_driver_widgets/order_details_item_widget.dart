import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class OrderDetailsItemWidget extends StatelessWidget {
  const OrderDetailsItemWidget({
    super.key, required this.title, required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title :',
            style: AppTextStyles.bold14Grey,
          ),
          Text(
            value,
            style: AppTextStyles.bold14Grey.copyWith(
              color: AppColors.darkMainColor,
            ),
          ),
        ],
      ),
    );
  }
}
