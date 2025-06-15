import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../helpers/cache_helper.dart';
import '../utils/app_colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: CacheHelper.getData(key: CacheHelperKeys.lang) == 'en'
          ? Alignment.topLeft
          : Alignment.topRight,
      child: InkWell(
        onTap: () {
          context.pop();
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}
