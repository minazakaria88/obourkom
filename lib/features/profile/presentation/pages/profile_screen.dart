import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../generated/assets.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/profile_screen_widgets/background_profile_widget.dart';
import '../widgets/profile_screen_widgets/logout_widget.dart';
import '../widgets/profile_screen_widgets/profile_button_widget.dart';
import '../widgets/profile_screen_widgets/profile_header_widget.dart';
import '../widgets/profile_screen_widgets/profile_setting_first_section.dart';
import '../widgets/profile_screen_widgets/profile_setting_second_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: 20.height),
          const ProfileHeaderWidget(),
          SliverToBoxAdapter(child: 20.height),
          const ProfileSettingsFirstSection(),
          SliverToBoxAdapter(child: 30.height),
          const ProfileSettingSecondSection(),
          SliverToBoxAdapter(child: 40.height),
          SliverToBoxAdapter(
            child: BackgroundProfileWidget(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileButtonWidget(
                      title: S.of(context).logout,
                      image: Assets.imagesExit,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const LogoutWidget(),
                        );
                      },
                    ),
                  ),
                  10.height,
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: 40.height),
        ],
      ),
    );
  }
}



