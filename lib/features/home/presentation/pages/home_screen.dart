import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/features/home/presentation/cubit/home_cubit.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../core/widgets/bottom_app_bar_widget.dart';
import '../widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<String> titles;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    titles = [
      S.of(context).main,
      S.of(context).orders,
      S.of(context).notifications,
      S.of(context).profile,
    ];
  }

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
                    titles[state.currentIndex],
                  ),
                ),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: state.currentIndex,
            children: cubit.screens,
          ),
        );
      },
    );
  }
}
