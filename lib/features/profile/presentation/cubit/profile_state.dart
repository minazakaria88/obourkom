part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, failure }

enum EditProfileStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  UserModel? userModel;
  ProfileStatus? profileStatus;
  EditProfileStatus? editProfileStatus;
  String ?errorMessage;
  ProfileState({
    this.userModel,
    this.profileStatus = ProfileStatus.initial,
    this.editProfileStatus = EditProfileStatus.initial,
    this.errorMessage
  });

  ProfileState copyWith({
    UserModel? userModel,
    ProfileStatus? profileStatus,
    EditProfileStatus? editProfileStatus,  String ?errorMessage,
  }) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      profileStatus: profileStatus ?? this.profileStatus,
      editProfileStatus: editProfileStatus ?? this.editProfileStatus,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }

  @override
  List<Object?> get props => [userModel, profileStatus, editProfileStatus, errorMessage];
}
