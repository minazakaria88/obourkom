import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/routes/routes.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/home/presentation/cubit/home_cubit.dart';
import 'package:oborkom/features/home/presentation/pages/home_screen.dart';
import 'package:oborkom/features/locations/presentation/cubit/locations_cubit.dart';
import 'package:oborkom/features/login/presentation/pages/login_screen.dart';
import 'package:oborkom/features/locations/presentation/pages/pick_location_screen.dart';
import 'package:oborkom/features/notification/presentation/pages/notification_screen.dart';
import 'package:oborkom/features/orders/presentation/pages/finding_drivers.dart';
import 'package:oborkom/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:oborkom/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:oborkom/features/profile/presentation/pages/profile_features_screens/about_us_screen.dart';
import 'package:oborkom/features/profile/presentation/pages/profile_features_screens/privacy_policy_screen.dart';
import 'package:oborkom/features/profile/presentation/pages/profile_features_screens/support_screen.dart';
import 'package:oborkom/features/register/presentation/cubit/register_cubit.dart';
import 'package:oborkom/features/register/presentation/pages/register_screen.dart';

import '../../features/locations/presentation/pages/locations_screen.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/main/presentation/pages/choose_car_screen.dart';
import '../../features/orders/presentation/cubit/orders_cubit.dart';
import '../../features/orders/presentation/pages/completed_order_details_screen.dart';
import '../../features/orders/presentation/pages/new_order.dart';
import '../../features/orders/presentation/pages/order_details_screen.dart';
import '../../features/otp/presentation/cubit/otp_cubit.dart';
import '../../features/otp/presentation/pages/otp_screen.dart';
import '../../features/profile/presentation/pages/profile_features_screens/terms_and_conditions_screen.dart';
import '../../injection.dart';

class AppRoues {
  static Route? onGenerateRoute(RouteSettings setting) {
    final arguments = setting.arguments;
    switch (setting.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.otp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OtpCubit>()..startTimerDuration(),
            child: const OtpScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      case Routes.chooseYourCar:
        return MaterialPageRoute(builder: (context) => const ChooseCarScreen());
      case Routes.newOrder:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OrdersCubit>(),
            child: const NewOrder(),
          ),
        );
      case Routes.pickLocation:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<LocationsCubit>()..getUserCurrentLocation(),
            child: PickOrderLocationScreen(mapContext: arguments as MapContext),
          ),
        );
      case Routes.editProfile:
        final arguments = setting.arguments as ProfileCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: arguments,
              child: const EditProfileScreen()),
        );
      case Routes.locations:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LocationsCubit>(),
            child: const LocationsScreen(),
          ),
        );
      case Routes.notifications:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );
      case Routes.support:
        return MaterialPageRoute(builder: (context) => const SupportScreen());
      case Routes.aboutUs:
        return MaterialPageRoute(builder: (context) => const AboutUsScreen());
      case Routes.termsAndConditions:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsScreen(),
        );
      case Routes.privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(),
        );
      case Routes.findDriver:
        final arguments = setting.arguments as OrdersCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: arguments..startTimer(),
              child: const FindingDriversScreen()),
        );
        case Routes.orderDetails:
        final arguments = setting.arguments as OrdersCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: arguments,
              child: const OrderDetailsScreen()),
        );
      case Routes.completedOrderDetails:
        final arguments = setting.arguments as OrdersCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: arguments,
              child: const CompletedOrderDetailsScreen()),
        );
      default:
        return null;
    }
  }
}
