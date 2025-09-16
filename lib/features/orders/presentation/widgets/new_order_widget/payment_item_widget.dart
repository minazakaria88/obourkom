import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/utils/app_styles.dart';

class PaymentItemWidget extends StatelessWidget {
  const PaymentItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(
                width: 40,
                height: 35,
                child: SvgPicture.asset(image, fit: BoxFit.fill)),
            20.width,
            Text(
              title,
              style: AppTextStyles.bold18Black.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
