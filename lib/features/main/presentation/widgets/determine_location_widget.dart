import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../cubit/main_cubit.dart';
import 'determine_location_manually.dart';

class DetermineLocationWidget extends StatelessWidget {
  const DetermineLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        80.height,
        SvgPicture.asset(Assets.imagesEnableLocation),
        20.height,
        Text(
          S.of(context).weCannotDetermineYourLocation,
          style: AppTextStyles.bold24Black,
        ),
        20.height,
        Text(
          S.of(context).openGps,
          textAlign: TextAlign.center,
          style: AppTextStyles.regular16Black,
        ),
        20.height,
        BlocBuilder<MainCubit, MainState>(
          builder: (context, state) =>
              state.getLocationState == GetLocationState.loading
              ? const CircularProgressIndicator(
                color: AppColors.mainColor,
              )
              : MyButton(
                  title: S.of(context).activeLocation,
                  onTap: () {
                    context.read<MainCubit>().getUserCurrentLocation();
                  },
                ),
        ),
        20.height,
        DetermineLocationManually(
          onTap: () {
            CacheHelper.saveData(
              key: CacheHelperKeys.locationEnabled,
              value: true,
            );
          },
        ),
      ],
    );
  }
}
