import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/routes/routes.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/services_model.dart';

class OneServicesWidget extends StatelessWidget {
  const OneServicesWidget({super.key, required this.model});

  final ServicesModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.chooseYourCar);
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withAlpha((0.1 * 255).toInt()),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset(model.image, gaplessPlayback: true)),
            10.height,
            Text(
              model.name,
              style: const TextStyle(
                color: AppColors.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
