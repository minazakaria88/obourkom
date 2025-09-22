import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../../language/data/models/language_model.dart';
import '../../../language/presentation/cubit/language_cubit.dart';

class ChooseLanguageWidget extends StatelessWidget {
  const ChooseLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Row(
        children: [
          const Icon(Icons.language, size: 25, color: AppColors.mainColor),
          const SizedBox(width: 5),
          Text(
            S.of(context).language,
            style: const TextStyle(
              color: AppColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      onSelected: (value) {
        log(value);
        context.read<LanguageCubit>().changeLanguage(value);
      },
      itemBuilder: (context) => languages
          .map((e) => PopupMenuItem(value: e.code, child: Text(e.name)))
          .toList(),
    );
  }
}
