import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oborkom/core/helpers/cache_helper.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());





  void initLanguage()
  {
    CacheHelper.saveData(key: CacheHelperKeys.lang, value: 'ar');

  }

  void changeLanguage(String languageCode) {
    CacheHelper.saveData(key: CacheHelperKeys.lang, value: languageCode);
    emit(LanguageChanged(languageCode: languageCode));
  }
}


