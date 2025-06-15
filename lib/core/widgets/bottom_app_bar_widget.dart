import 'package:flutter/cupertino.dart';
import 'package:oborkom/core/utils/app_colors.dart';

class BottomAppBarWidget extends StatelessWidget  implements PreferredSizeWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      color: AppColors.mainColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(2);
}
