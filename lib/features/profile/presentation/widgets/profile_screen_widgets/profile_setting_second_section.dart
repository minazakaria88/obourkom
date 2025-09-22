import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/routes/routes.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/profile_button_widget.dart';

import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/profile_cubit.dart';
import 'background_profile_widget.dart';

class ProfileSettingSecondSection extends StatelessWidget {
  const ProfileSettingSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BackgroundProfileWidget(
        child: Column(
          children: [
            ProfileButtonWidget(
              title: S.of(context).PrivacyPolicy,
              image: Assets.imagesPrivacy,
              onTap: () {
                context.pushNamed(Routes.privacyPolicy);
              },
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).TermsAndConditions,
              image: Assets.imagesTerms,
              onTap: () {
                context.pushNamed(Routes.termsAndConditions);
              },
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).faq,
              image: Assets.imagesQuestionCircle,
              onTap: () {
                context.pushNamed(
                  Routes.faq,
                  arguments: context.read<ProfileCubit>()..getFaq(),
                );
              },
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).aboutUs,
              image: Assets.imagesAboutUs,
              onTap: () {
                context.pushNamed(Routes.aboutUs);
              },
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).support,
              image: Assets.imagesSupport,
              onTap: () {
                context.pushNamed(Routes.support);
              },
            ),
            10.height,
          ],
        ),
      ),
    );
  }
}
