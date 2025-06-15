import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withAlpha(150),
        child: const Center(child: CircularProgressIndicator(
          color: AppColors.mainColor,
        )),
      ),
    );
  }
}
