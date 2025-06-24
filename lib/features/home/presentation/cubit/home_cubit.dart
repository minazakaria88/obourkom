import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:oborkom/features/orders/presentation/pages/order_screen.dart';
import 'package:oborkom/main.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection.dart';
import '../../../main/presentation/cubit/main_cubit.dart';
import '../../../notification/presentation/cubit/notification_cubit.dart';
import '../../../notification/presentation/pages/notification_screen.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../../../profile/presentation/pages/profile_screen.dart';
import '../../../main/presentation/pages/main_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(currentIndex: 0));

  List<Widget> screens = [
    BlocProvider(
      create: (context) => getIt<MainCubit>()..getService()..getSlider(),
      child: const MainScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<OrdersCubit>(),
      child: const OrderScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<NotificationCubit>()..getNotification(),
      child: const NotificationScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: const ProfileScreen(),
    ),
  ];

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  final List<String> titles = [
    S.of(NavigatorClass.navigatorKey.currentState!.context).main,
    S.of(NavigatorClass.navigatorKey.currentState!.context).orders,
    S.of(NavigatorClass.navigatorKey.currentState!.context).notifications,
    S.of(NavigatorClass.navigatorKey.currentState!.context).profile,
  ];
}
