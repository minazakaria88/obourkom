import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../utils/app_colors.dart';
import 'bottom_app_bar_widget.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.actions});
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
      ),
      title: Text(title),
      actions: actions,
      bottom: const BottomAppBarWidget(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
