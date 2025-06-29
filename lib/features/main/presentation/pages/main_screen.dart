import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/main/presentation/cubit/main_cubit.dart';
import 'package:oborkom/features/main/presentation/widgets/services_widget.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../widgets/determine_location_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    if(CacheHelper.getData(key: CacheHelperKeys.locationEnabled) == true){
      BlocProvider.of<MainCubit>(context).getUserCurrentLocation();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          50.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${S.of(context).welcome}  mina !',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainColor,
                      ),
                    ),
                    5.height,
                    BlocBuilder<MainCubit, MainState>(
                      buildWhen: (previous, current) =>
                          previous.location != current.location,
                      builder: (context, state) => Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        state.location ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {

                },
                icon: SvgPicture.asset(Assets.imagesNotification),
              ),
            ],
          ),
          20.height,
          BlocBuilder<MainCubit, MainState>(
            buildWhen: (previous, current) =>
                previous.location != current.location,
            builder: (context, state) =>
                CacheHelper.getData(key: CacheHelperKeys.locationEnabled) ==
                    true
                ? const Expanded(child: MyServicesWidget())
                : const DetermineLocationWidget(),
          ),
        ],
      ),
    );
  }
}
