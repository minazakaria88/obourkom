import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/cached_image_widget.dart';
import '../../data/models/categories_model.dart';

class TruckItem extends StatelessWidget {
  final TruckModel truck;
  final VoidCallback onTap;

  const TruckItem({super.key, required this.truck, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withAlpha((0.1 * 255).toInt()),
              spreadRadius: 0,
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: CachedImageWidget(imageUrl: truck.image ?? '')),
            const SizedBox(height: 10),
            Flexible(
              child: Text(
                truck.name ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.darkMainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
