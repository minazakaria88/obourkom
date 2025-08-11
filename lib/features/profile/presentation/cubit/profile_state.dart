part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, failure }

enum EditProfileStatus { initial, loading, success, failure }

enum ImageStatus { initial, loading, success, failure }



enum GetFaqStatus { initial, loading, success, failure }

extension ProfileStatusX on ProfileState {
  bool get isLoading => profileStatus == ProfileStatus.loading;
  bool get isSuccess => profileStatus == ProfileStatus.success;
  bool get isFailure => profileStatus == ProfileStatus.failure;
  bool get isEditProfileLoading => editProfileStatus == EditProfileStatus.loading;
  bool get isEditProfileSuccess => editProfileStatus == EditProfileStatus.success;
  bool get isEditProfileFailure => editProfileStatus == EditProfileStatus.failure;
  bool get isImageLoading => imageStatus == ImageStatus.loading;
  bool get isImageSuccess => imageStatus == ImageStatus.success;
  bool get isImageFailure => imageStatus == ImageStatus.failure;
}

class ProfileState extends Equatable {
  CachedUserModel? userModel;
  ProfileStatus? profileStatus;
  EditProfileStatus? editProfileStatus;
  String? errorMessage;
  ImageStatus? imageStatus;
  FaqModel ? faqs ;
  GetFaqStatus? getFaqStatus;

  ProfileState({
    this.userModel,
    this.profileStatus = ProfileStatus.initial,
    this.editProfileStatus = EditProfileStatus.initial,
    this.errorMessage,
    this.imageStatus,
    this.faqs ,
    this.getFaqStatus=GetFaqStatus.initial
  });

  ProfileState copyWith({
    CachedUserModel? userModel,
    ProfileStatus? profileStatus,
    EditProfileStatus? editProfileStatus,
    String? errorMessage,
    ImageStatus? imageStatus,
    FaqModel? faqs,
    GetFaqStatus? getFaqStatus
  }) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      profileStatus: profileStatus ?? this.profileStatus,
      editProfileStatus: editProfileStatus ?? this.editProfileStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      imageStatus: imageStatus ?? this.imageStatus,
      faqs: faqs ?? this.faqs,
      getFaqStatus: getFaqStatus ?? this.getFaqStatus
    );
  }

  @override
  List<Object?> get props => [
    userModel,
    profileStatus,
    editProfileStatus,
    errorMessage,
    imageStatus,
    faqs,
    getFaqStatus
  ];
}
