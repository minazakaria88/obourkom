import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/shimmer_listview.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/order_screen_widget/complete_order_listview.dart';
import '../widgets/order_screen_widget/recent_order_listview.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<OrdersCubit>().getOrders(1);
    context.read<OrdersCubit>().getMoreOrders(_scrollController);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 70,
            child: CupertinoSlidingSegmentedControl(
              children: {
                0: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    S.of(context).currentOrders,
                    style: selectedIndex == 0
                        ? AppTextStyles.bold18Black.copyWith(
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                1: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    S.of(context).previous,
                    style: selectedIndex == 1
                        ? AppTextStyles.bold18Black.copyWith(
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              },
              thumbColor: AppColors.mainColor,
              groupValue: selectedIndex,
              onValueChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          20.height,
          BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              final recentOrders = state.recentOrdersList ?? [];
              final completedOrders = state.completedOrdersList ?? [];
              if (state.getOrdersStatus == GetOrdersStatus.failure) {
                return Center(child: Text(state.errorMessage ?? ''));
              }
              if (state.getOrdersStatus == GetOrdersStatus.loading &&
                      state.recentOrdersList == null ||
                  state.completedOrdersList == null) {
                return const Expanded(child: ShimmerListview());
              }
              return Expanded(
                child: selectedIndex == 0
                    ? RecentOrderList(
                        selectedIndex: selectedIndex,
                        scrollController: _scrollController,
                        recentOrders: recentOrders,
                        state: state,
                      )
                    : CompletedOrderList(
                        state: state,
                        selectedIndex: selectedIndex,
                        scrollController: _scrollController,
                        completedOrders: completedOrders,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
