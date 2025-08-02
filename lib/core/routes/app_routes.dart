import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/routes/routes.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/presentation/cubit/find_and_chat_with_driver_cubit.dart';
import 'package:oborkom/features/home/presentation/cubit/home_cubit.dart';
import 'package:oborkom/features/home/presentation/pages/home_screen.dart';
import 'package:oborkom/features/locations/presentation/cubit/locations_cubit.dart';
import 'package:oborkom/features/login/presentation/pages/login_screen.dart';
import 'package:oborkom/features/locations/presentation/pages/pick_location_screen.dart';
import 'package:oborkom/features/main/data/models/truck_size.dart';
import 'package:oborkom/features/notification/presentation/pages/notification_screen.dart';
import 'package:oborkom/features/find_and_chat_with_driver/presentation/pages/finding_drivers.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import 'package:oborkom/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:oborkom/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:oborkom/features/profile/presentation/pages/profile_features_screens/about_us_screen.dart';
import 'package:oborkom/features/profile/presentation/pages/profile_features_screens/privacy_policy_screen.dart';
import 'package:oborkom/features/profile/presentation/pages/profile_features_screens/support_screen.dart';
import 'package:oborkom/features/register/presentation/cubit/register_cubit.dart';
import 'package:oborkom/features/register/presentation/pages/register_screen.dart';
import '../../features/locations/presentation/pages/locations_screen.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/main/presentation/cubit/main_cubit.dart';
import '../../features/main/presentation/pages/choose_car_screen.dart';
import '../../features/orders/data/models/submit_order_model.dart';
import '../../features/orders/presentation/cubit/orders_cubit.dart';
import '../../features/orders/presentation/pages/completed_order_details_screen.dart';
import '../../features/orders/presentation/pages/new_order.dart';
import '../../features/find_and_chat_with_driver/presentation/pages/order_details_screen.dart';
import '../../features/otp/presentation/cubit/otp_cubit.dart';
import '../../features/otp/presentation/pages/otp_screen.dart';
import '../../features/profile/presentation/pages/profile_features_screens/terms_and_conditions_screen.dart';
import '../../injection.dart';
import '../helpers/error_handler.dart';
import '../widgets/no_internet_screen.dart';

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
        final arguments = setting.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OtpCubit>()..startTimerDuration(),
            child: OtpScreen(
              otpType: arguments['otpType'],
              phoneNumber: arguments['phone'],
            ),
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
        final arguments = setting.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: arguments['cubit'] as MainCubit,
            child: const ChooseCarScreen(),
          ),
        );
      case Routes.newOrder:
        final arguments = setting.arguments as TruckSizeModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OrdersCubit>(),
            child:  NewOrder(truckSize: arguments,),
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
            child: const EditProfileScreen(),
          ),
        );
      case Routes.locations:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LocationsCubit>()..getLocations(),
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
        final arguments = setting.arguments as ProfileCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: arguments,
            child: const AboutUsScreen(),
          ),
        );
      case Routes.termsAndConditions:
        return MaterialPageRoute(
          builder: (context) => const TermsAndConditionsScreen(),
        );
      case Routes.privacyPolicy:
        return MaterialPageRoute(
          builder: (context) => const PrivacyPolicyScreen(),
        );
      case Routes.findDriver:
        final arguments = setting.arguments as SubmitOrderModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<FindAndChatWithDriverCubit>()
              ..startTimer()
              ..listenForOffers(orderId: arguments.id.toString()),
            child: FindingDriversScreen(model: arguments),
          ),
        );
      case Routes.orderDetails:
        final arguments = setting.arguments as Map<String, dynamic>;
        final order = arguments['order'] as SubmitOrderModel;
        final driver = arguments['driver'] as OfferModel;
        logger.i(driver.driverId);
        logger.i(order.id);
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<FindAndChatWithDriverCubit>()
              ..listenForMessages(
                driverId: driver.driverId.toString(),
                orderId: order.id.toString(),
              )
              ..listenForOrderStatus(orderId: order.id.toString()),
            child: OrderDetailsScreen(orderModel: order, offerModel: driver),
          ),
        );
      case Routes.completedOrderDetails:
        final arguments = setting.arguments as OrderDataModel;
        return MaterialPageRoute(
          builder: (context) =>  CompletedOrderDetailsScreen(model: arguments,),
        );
      case Routes.noInternet:
        return MaterialPageRoute(builder: (context) => const NoInternet());
      case Routes.error:
        final arguments = setting.arguments as String;
        return MaterialPageRoute(
          builder: (context) => CustomErrorWidget(error: arguments),
        );
      default:
        return null;
    }
  }
}
