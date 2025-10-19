import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/shimmer_item.dart';
import 'package:oborkom/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/my_app_bar.dart';
import '../../../../../generated/l10n.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).aboutUs),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.aboutUsModel == null
                ? const ShimmerItem(
                    width: double.infinity,
                    height: 200,
                    margin: 12,
                  )
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        20.height,
                        BackgroundProfileWidget(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Text(
                                S.of(context).aboutUs,
                                style: AppTextStyles.bold18Black,
                              ),
                            ),
                          ),
                        ),
                        30.height,
                        BackgroundProfileWidget(
                            child: Html(
                              data: state.aboutUsModel!.content,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
          },
        ),
      ),
    );
  }
}
