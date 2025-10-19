part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, failure }

enum EditProfileStatus { initial, loading, success, failure }

enum ImageStatus { initial, loading, success, failure }




enum GetFaqStatus { initial, loading, success, failure }

enum GetAboutUs  { initial, loading, success, failure }

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


@immutable
class ProfileState extends Equatable {
  final CachedUserModel? userModel;
  final ProfileStatus? profileStatus;
  final EditProfileStatus? editProfileStatus;
  final String? errorMessage;
  final ImageStatus? imageStatus;
  final FaqModel ? faqs ;
  final GetFaqStatus? getFaqStatus;
  final String ? image;
  final GetAboutUs ?getAboutUs;
  final AboutUsModel? aboutUsModel;

  const ProfileState({
    this.userModel,
    this.profileStatus = ProfileStatus.initial,
    this.editProfileStatus = EditProfileStatus.initial,
    this.errorMessage,
    this.imageStatus,
    this.faqs ,
    this.getFaqStatus=GetFaqStatus.initial,
    this.getAboutUs=GetAboutUs.initial,
    this.aboutUsModel,
    this.image
  });

  ProfileState copyWith({
    CachedUserModel? userModel,
    ProfileStatus? profileStatus,
    EditProfileStatus? editProfileStatus,
    String? errorMessage,
    ImageStatus? imageStatus,
    FaqModel? faqs,
    GetFaqStatus? getFaqStatus,
    String ? image,
    GetAboutUs ?getAboutUs,
    AboutUsModel ?aboutUsModel,

  }) {
    return ProfileState(
        userModel: userModel ?? this.userModel,
        profileStatus: profileStatus ?? this.profileStatus,
        editProfileStatus: editProfileStatus ?? this.editProfileStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        imageStatus: imageStatus ?? this.imageStatus,
        faqs: faqs ?? this.faqs,
        getFaqStatus: getFaqStatus ?? this.getFaqStatus,
        image: image ?? this.image,
        getAboutUs:  getAboutUs ?? this.getAboutUs,
        aboutUsModel: aboutUsModel ?? this.aboutUsModel
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
    getFaqStatus,
    getAboutUs,
    aboutUsModel,
    image
  ];
}
