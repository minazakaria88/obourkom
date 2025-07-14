import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/orders/presentation/widgets/order_screen_widget/order_listview_item_widget.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubit/orders_cubit.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    context.read<OrdersCubit>().getOrders();
    super.initState();
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
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeIn,
              child: selectedIndex == 0
                  ? ListView.separated(
                      key: ValueKey(selectedIndex),
                      itemBuilder: (context, index) =>
                          const OrderListviewItemWidget(),
                      separatorBuilder: (BuildContext context, int index) =>
                          20.height,
                      itemCount: 10,
                    )
                  : ListView.separated(
                      key: ValueKey(selectedIndex),
                      itemBuilder: (context, index) =>
                          const OrderListviewItemWidget(),
                      separatorBuilder: (BuildContext context, int index) =>
                          20.height,
                      itemCount: 10,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
