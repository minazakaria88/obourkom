import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/features/home/presentation/cubit/home_cubit.dart';
import '../../../../core/widgets/bottom_app_bar_widget.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: state.currentIndex == 0
              ? null
              : AppBar(
                  bottom: const BottomAppBarWidget(),
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Text(
                    cubit.titles[state.currentIndex],
                  ),
                ),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
           body://cubit.screens[state.currentIndex],
          IndexedStack(
            index: state.currentIndex,
            children: cubit.screens,
          ),
        );
      },
    );
  }
}
