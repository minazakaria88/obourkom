import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/routes/routes.dart';

import '../../../../core/utils/app_colors.dart';
import '../../data/models/services_model.dart';

class OneServicesWidget extends StatelessWidget {
  const OneServicesWidget({super.key, required this.model, required this.onTap});

  final ServicesModel model;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff065C73).withAlpha((0.1 * 255).toInt()),
              spreadRadius: 0,
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset(model.image!, gaplessPlayback: true)),
            10.height,
            Text(
              model.name!,
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
