class LanguageModel {
  final String code;
  final String name;

  LanguageModel({required this.code, required this.name});
}

List<LanguageModel> languages = [
  LanguageModel(code: 'en', name: 'English'),
  LanguageModel(code: 'ar', name: 'العربية'),
];
