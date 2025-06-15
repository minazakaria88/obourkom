part of 'profile_cubit.dart';


enum  ProfileStatus {
  initial,
  loading,
  success,
  failure,
}

class ProfileState extends Equatable {
  UserModel? userModel;
  ProfileStatus ? profileStatus ;
  ProfileState({this.userModel, this.profileStatus = ProfileStatus.initial});

  ProfileState copyWith({
    UserModel? userModel,
    ProfileStatus? profileStatus
  }) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      profileStatus: profileStatus ?? this.profileStatus
    );
  }


  @override
  List<Object?> get props => [userModel];
}

