import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oborkom/core/helpers/cache_helper.dart';

import '../../../../core/api/api_helper.dart';
import '../../../../injection.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  void initLanguage() {
    String? lang = CacheHelper.getData(key: CacheHelperKeys.lang);
    if (lang == null) {
      CacheHelper.saveData(key: CacheHelperKeys.lang, value: 'ar');
    }
  }

  void changeLanguage(String languageCode) async {
    await CacheHelper.saveData(key: CacheHelperKeys.lang, value: languageCode);
    getIt<ApiHelper>().setLanguageIntoHeaders(languageCode);
    emit(LanguageChanged(languageCode: languageCode));
  }
}
