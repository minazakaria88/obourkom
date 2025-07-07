import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/profile_image.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withAlpha((0.1 * 255).toInt()),
              spreadRadius: 0.7,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: AppColors.mainColor),
        ),
        child: Row(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (previous, current) =>
                  previous.userModel != current.userModel,
              builder: (context, state) {
                if (state.profileStatus == ProfileStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  );
                }
                return Expanded(
                  child: Row(
                    children: [
                      Hero(
                        tag: state.userModel!.image!,
                        child: ProfileImage(image: state.userModel!.image),
                      ),
                      20.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.userModel?.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.bold18Black,
                          ),
                          10.height,
                          Text(
                            state.userModel?.email ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regular12Grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            20.width,
            IconButton(
              onPressed: () {
                context.pushNamed(
                  Routes.editProfile,
                  arguments: context.read<ProfileCubit>(),
                );
              },
              icon: const Icon(Icons.arrow_forward_ios),
              color: AppColors.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
