import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oborkom/bloc_observer.dart';
import 'package:oborkom/core/helpers/cache_helper.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/routes/app_routes.dart';
import 'package:oborkom/core/routes/routes.dart';
import 'package:oborkom/core/utils/app_theme.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/language/presentation/cubit/language_cubit.dart';
import 'package:oborkom/injection.dart';
import 'package:toastification/toastification.dart';
import 'core/api/api_helper.dart';
import 'core/helpers/error_handler.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

bool isLoggedIn = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // FlutterError.onError = ErrorHandler.handleFlutterError;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  ApiHelper.init();
  await checkIfUserLoggedIn();
  setupServicesLocator();
  Bloc.observer = MyBlocObserver();
  runApp(DevicePreview(enabled: false, builder: (context) => const OborKom()));
}

class OborKom extends StatelessWidget {
  const OborKom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguageCubit>()..initLanguage(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) => ToastificationWrapper(
          child: MaterialApp(
            navigatorKey: NavigatorClass.navigatorKey,
            title: '3bourkom',
            theme: appTheme(),
            locale: Locale(
              CacheHelper.getData(key: CacheHelperKeys.lang) ?? 'en',
            ),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoues.onGenerateRoute,
            initialRoute: isLoggedIn ? Routes.home : Routes.login,
          ),
        ),
      ),
    );
  }
}

class NavigatorClass {
  static final navigatorKey = GlobalKey<NavigatorState>();
}

Future<void> checkIfUserLoggedIn() async {
  String? token = await CacheHelper.getSecureString(CacheHelperKeys.token);
  logger.i(token);
  if (!token.isNullOrEmpty()) {
    isLoggedIn = true;
  }
}

//https://firebase.google.com/docs/crashlytics/get-started?platform=flutter

