import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oborkom/features/profile/data/models/user_model.dart';
import 'package:oborkom/features/profile/data/repositories/profile_repo.dart';

import '../../../../core/api/failure.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepository}) : super(ProfileState());

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final ProfileRepository profileRepository;

  void fillForm(UserModel userModel) {
    emailController.text = userModel.email ?? '';
    nameController.text = userModel.name ?? '';
    phoneController.text = userModel.phone ?? '';
  }

  void getUserProfile() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    try {
      final result = await profileRepository.getUser();
      fillForm(result);
      emit(
        state.copyWith(profileStatus: ProfileStatus.success, userModel: result),
      );
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          profileStatus: ProfileStatus.failure,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          profileStatus: ProfileStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void updateProfile() async {
    emit(state.copyWith(editProfileStatus: EditProfileStatus.loading));
    try {
      final user = UserModel(
        email: emailController.text,
        name: nameController.text,
        phone: phoneController.text,
      );
      await profileRepository.updateProfile(user.toJson());
      emit(state.copyWith(editProfileStatus: EditProfileStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          editProfileStatus: EditProfileStatus.failure,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          editProfileStatus: EditProfileStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void updateImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(imageStatus: ImageStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(imageStatus: ImageStatus.success));
    }
  }
}
