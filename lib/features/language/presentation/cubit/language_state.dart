part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageChanged extends LanguageState {
  final String languageCode;
  const LanguageChanged({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}
