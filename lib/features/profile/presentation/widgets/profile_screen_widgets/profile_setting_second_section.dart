import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/routes/routes.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/profile_button_widget.dart';

import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import 'background_profile_widget.dart';

class ProfileSettingSecondSection extends StatelessWidget {
  const ProfileSettingSecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BackgroundProfileWidget(
        child: Column(
          children: [
            ProfileButtonWidget(
              title: S.of(context).PrivacyPolicy,
              image: Assets.imagesPrivacy,
              onTap: () {},
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).TermsAndConditions,
              image: Assets.imagesTerms,
              onTap: () {},
            ),
            10.height,
            ProfileButtonWidget(
              title: S.of(context).aboutUs,
              image: Assets.imagesAboutUs,
              onTap: () {},
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
