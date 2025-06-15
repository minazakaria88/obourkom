import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 8,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.mainColor,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
      onTap: (index) => onTap(index),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.imagesHome,
            colorFilter: currentIndex == 0
                ? const ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn)
                : const ColorFilter.mode(Color(0xff474747), BlendMode.srcIn),
          ),
          label: S.of(context).main,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.imagesOrders,
            colorFilter: currentIndex == 1
                ? const ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn)
                : null,
          ),
          label: S.of(context).orders,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.imagesBell,
            colorFilter: currentIndex == 2
                ? const ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn)
                : null,
          ),
          label: S.of(context).notifications,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.imagesUser,
            colorFilter: currentIndex == 3
                ? const ColorFilter.mode(AppColors.mainColor, BlendMode.srcIn)
                : null,
          ),
          label: S.of(context).profile,
        ),
      ],
    );
  }
}
