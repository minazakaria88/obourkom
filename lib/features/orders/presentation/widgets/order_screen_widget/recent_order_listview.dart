import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../../core/widgets/loader_widget.dart';
import '../../../data/models/order_model.dart';
import '../../cubit/orders_cubit.dart';
import 'order_listview_item_widget.dart';


class RecentOrderList extends StatelessWidget {
  const RecentOrderList({
    super.key,
    required this.selectedIndex,
    required this.recentOrders,
    required this.scrollController,
    required this.state,
  });

  final int selectedIndex;
  final ScrollController scrollController;
  final List<OrderDataModel> recentOrders;
  final OrdersState state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: selectedIndex == 0 ? scrollController : null,
      key: ValueKey(selectedIndex),
      itemBuilder: (context, index) => index != recentOrders.length
          ? OrderListviewItemWidget(model: recentOrders[index])
          : state.getOrdersStatus == GetOrdersStatus.loading
          ? const LoaderWidget()
          : const SizedBox(),
      separatorBuilder: (BuildContext context, int index) => 20.height,
      itemCount: recentOrders.length+1,
    );
  }
}
