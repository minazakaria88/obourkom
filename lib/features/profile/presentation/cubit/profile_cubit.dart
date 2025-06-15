import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oborkom/features/profile/data/models/user_model.dart';
import 'package:oborkom/features/profile/data/repositories/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepository}) : super(ProfileState());

  final ProfileRepository profileRepository;
  void getUserProfile() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    try {
      final result = await profileRepository.getUser();
      emit(state.copyWith(profileStatus: ProfileStatus.success, userModel: result));
    } catch (e) {
      emit(state.copyWith(profileStatus: ProfileStatus.failure));
    }
  }

}
