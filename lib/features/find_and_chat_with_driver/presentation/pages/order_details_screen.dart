import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../orders/data/models/submit_order_model.dart';
import '../cubit/find_and_chat_with_driver_cubit.dart';
import '../widgets/finding_driver_widgets/order_details_widget.dart';
import '../widgets/order_details_widget/chat_listview.dart';
import '../widgets/order_details_widget/driver_location_widget.dart';
import '../widgets/order_details_widget/order_status_widget.dart';
import '../widgets/order_details_widget/pay_or_change_supplier_widget.dart';
import '../widgets/order_details_widget/send_message_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.orderModel,
    required this.offerModel,
  });

  final SubmitOrderModel orderModel;
  final OfferModel offerModel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FindAndChatWithDriverCubit>();
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).orderDetails),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 80,
              ), // space for input field
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: 20.height),
                  const OrderStatusWidget(),
                  SliverToBoxAdapter(child: 20.height),
                  SliverToBoxAdapter(
                    child: OrderDetailsWidget(model: orderModel,offerModel: offerModel,),
                  ),
                  SliverToBoxAdapter(child: 10.height),
                  PayOrChangeSupplier(orderModel: orderModel, offerModel: offerModel),
                  SliverToBoxAdapter(child: 20.height),
                  SliverToBoxAdapter(child: DriverDetails(model: offerModel)),
                  SliverToBoxAdapter(child: 20.height),
                  const ChatListview(),
                  SliverToBoxAdapter(child: 20.height),
                ],
              ),
            ),
            SendMessageWidget(
              cubit: cubit,
              orderId: orderModel.id.toString(),
              driverId: offerModel.driverId.toString(),
            ),
          ],
        ),
      ),
    );
  }
}



