import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../language/data/models/profile_language_model.dart';
import '../../../../language/presentation/cubit/language_cubit.dart';
import 'choose_laguage_profile_widget.dart';

class LanguageModelSheetWidget extends StatelessWidget {
  const LanguageModelSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(S.of(context).changeLanguage, style: AppTextStyles.bold24Black),
        40.height,
        BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return ListView.separated(
              itemCount: profileLanguages.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                profileLanguages[index].isSelected =
                    CacheHelper.getData(key: CacheHelperKeys.lang) ==
                    profileLanguages[index].code;
                return ChooseLanguageProfileWidget(
                  onTap: () {
                    context.read<LanguageCubit>().changeLanguage(
                      profileLanguages[index].code,
                    );
                  },
                  profileLanguages: profileLanguages[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => 20.height,
            );
          },
        ),
        30.height,
      ],
    );
  }
}
