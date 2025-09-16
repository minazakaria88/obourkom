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
  HomeCubit()
    : super(
        const HomeState(
          currentIndex: 0,
          isVisited: [true, false, false, false],
        ),
      );

  List<Widget> screens = [
    BlocProvider(
      create: (context) => getIt<MainCubit>()
        ..getCategories()
        ..getSlider(),
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
    List<bool> isVisited = List.from(state.isVisited);
    if (!state.isVisited[index]) {
      isVisited[index] = true;
    }
    emit(state.copyWith(currentIndex: index, isVisited: isVisited));
  }

  List<String> titles(BuildContext context) {
    return [
      S.of(context).main,
      S.of(context).orders,
      S.of(context).notifications,
      S.of(context).profile,
    ];
  }
}
