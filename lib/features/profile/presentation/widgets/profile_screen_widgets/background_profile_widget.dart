import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class BackgroundProfileWidget extends StatelessWidget {
  const BackgroundProfileWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withAlpha((0.1 * 255).toInt()),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
