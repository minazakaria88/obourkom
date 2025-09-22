import 'package:oborkom/generated/assets.dart';

class ProfileLanguageModel {
  final String name;
  final String code;
  final String image;
  bool isSelected;

  ProfileLanguageModel(
    this.image, {
    required this.name,
    required this.code,
    this.isSelected = false,
  });
}

List<ProfileLanguageModel> profileLanguages = [
  ProfileLanguageModel(Assets.imagesUnited, name: 'English', code: 'en'),
  ProfileLanguageModel(Assets.imagesSaudi, name: 'العربية', code: 'ar'),
  ProfileLanguageModel(Assets.imagesUrdu, name: 'الأردية', code: 'ur'),
];
