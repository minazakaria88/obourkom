import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';

import '../../../../../core/widgets/loader_widget.dart';
import '../../../data/models/order_model.dart';
import '../../cubit/orders_cubit.dart';
import 'order_listview_item_widget.dart';

class CompletedOrderList extends StatelessWidget {
  const CompletedOrderList({
    super.key,
    required this.selectedIndex,
    required this.completedOrders,
    required this.scrollController,
    required this.state,
  });

  final int selectedIndex;
  final ScrollController scrollController;
  final List<OrderDataModel> completedOrders;
  final OrdersState state;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: selectedIndex == 1 ? scrollController : null,
      key: ValueKey(selectedIndex),
      itemBuilder: (context, index) => index != completedOrders.length
          ? OrderListviewItemWidget(model: completedOrders[index])
          : state.getOrdersStatus == GetOrdersStatus.loading
          ? const LoaderWidget()
          : const SizedBox(),
      separatorBuilder: (BuildContext context, int index) => 20.height,
      itemCount: completedOrders.length + 1,
    );
  }
}
