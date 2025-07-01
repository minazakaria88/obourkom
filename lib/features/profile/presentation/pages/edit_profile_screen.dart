import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/loader_widget.dart';
import 'package:oborkom/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/profile_image.dart';
import 'package:oborkom/generated/assets.dart';
import '../../../../core/helpers/validation_inputs_class.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/my_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../widgets/profile_screen_widgets/background_profile_widget.dart';
import '../widgets/profile_screen_widgets/delete_account_widget.dart';
import '../widgets/profile_screen_widgets/profile_button_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).personalAccount),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.height,
                  const SizedBox(width: double.infinity),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      state.isImageLoading
                          ? const LoaderWidget()
                          : state.userModel != null
                          ? ProfileImage(
                              image: state.userModel?.image,
                              height: 117,
                              width: 117,
                            )
                          : const ProfileImage(height: 117, width: 117),
                      Positioned(
                        top: 70,
                        left: 50,
                        child: InkWell(
                          onTap: () {
                            cubit.updateImage();
                          },
                          child: SvgPicture.asset(Assets.imagesEditImage),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.height,
                        Text(
                          S.of(context).name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        10.height,
                        MyTextFormField(
                          controller: cubit.nameController,
                          validator: (String? value) {
                            return ValidationClass.validateText(
                              value,
                              S.of(context).pleaseEnterAValidName,
                            );
                          },
                          hint: S.of(context).writeYourNameHere,
                        ),
                        15.height,
                        Text(
                          S.of(context).phoneNumber,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        10.height,
                        MyTextFormField(
                          controller: cubit.phoneController,
                          validator: (String? value) {
                            return ValidationClass.validatePhone(
                              value,
                              context,
                            );
                          },
                          textInputType: TextInputType.phone,
                          hint: '5xxxxxxxx',
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(13.0),
                            child: Text(
                              '+966',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),

                        15.height,

                        Text(
                          S.of(context).email,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        10.height,
                        MyTextFormField(
                          controller: cubit.emailController,
                          validator: (String? value) {
                            return ValidationClass.validateEmail(
                              value,
                              context,
                            );
                          },
                          textInputType: TextInputType.emailAddress,
                          hint: 'name@example.com',
                        ),
                        15.height,
                        state.editProfileStatus == EditProfileStatus.loading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.mainColor,
                                ),
                              )
                            : MyButton(
                                title: S.of(context).edit,
                                onTap: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    //cubit.updateProfile();
                                  }
                                },
                              ),
                        30.height,
                        Text(
                          S.of(context).doYouWantToDeleteYourAccount,
                          style: AppTextStyles.bold18Black,
                        ),
                        15.height,
                        BackgroundProfileWidget(
                          child: ProfileButtonWidget(
                            title: S.of(context).deleteAccount,
                            image: Assets.imagesDelete,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    const DeleteAccountWidget(),
                              );
                            },
                          ),
                        ),
                        15.height,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
