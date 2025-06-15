import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/profile_button_widget.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/presentation/cubit/home_cubit.dart';
import '../../cubit/profile_cubit.dart';
import '../language/language_model_sheet_widget.dart';
import 'background_profile_widget.dart';

class ProfileSettingsFirstSection extends StatelessWidget {
  const ProfileSettingsFirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BackgroundProfileWidget(
        child: Column(
          children: [
            ProfileButtonWidget(
              title: S.of(context).personalAccount,
              onTap: () {
                context.pushNamed(Routes.editProfile,arguments: context.read<ProfileCubit>());
              },
              image: Assets.imagesProfile,
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).addresses,
              onTap: () {
                context.pushNamed(Routes.locations);
              },
              image: Assets.imagesLocation,
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).notifications,
              onTap: () {
                context.read<HomeCubit>().changeIndex(2);
              },
              image: Assets.imagesProfileNotification,
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).profileLanguage,
              onTap: () {
                buildShowModalBottomSheet(context);
              },
              image: Assets.imagesLanguage,
              trailing: Text(
                S.of(context).language,
                style: AppTextStyles.bold18Black.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            10.height,
          ],
        ),
      ),
    );
  }
  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: const LanguageModelSheetWidget(),
      ),
    );
  }

}
