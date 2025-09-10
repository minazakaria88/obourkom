import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_colors.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/core/widgets/my_button.dart';
import 'package:oborkom/features/find_and_chat_with_driver/data/models/offer_model.dart';
import 'package:oborkom/features/find_and_chat_with_driver/presentation/widgets/order_details_widget/change_supplier_widget.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../orders/data/models/submit_order_model.dart';
import '../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import '../cubit/find_and_chat_with_driver_cubit.dart';
import '../widgets/finding_driver_widgets/order_details_widget.dart';
import '../widgets/order_details_widget/chat_listview.dart';
import '../widgets/order_details_widget/driver_location_widget.dart';
import '../widgets/order_details_widget/order_status_widget.dart';
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
      appBar: MyAppBar(
        title: S.of(context).orderDetails,
      ),
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
                    child: OrderDetailsWidget(model: orderModel),
                  ),
                  SliverToBoxAdapter(child: 10.height),
                  SliverToBoxAdapter(
                    child: BlocConsumer<FindAndChatWithDriverCubit, FindAndChatWithDriverState>(
                      listener: (context, state) {

                      },
                      builder: (context, state) {
                        return statusToNumber[state.orderStatus]==null||statusToNumber[state.orderStatus]!>0?Container():BackgroundProfileWidget(
                          child: SizedBox(
                            height: 65,
                            child: Row(
                              children: [
                                Expanded(
                                  child: MyButton(
                                    title: S.of(context).payNow,
                                    onTap: () {
                                      cubit.changeOrderStatus(
                                        orderId: orderModel.id.toString(),
                                        status: onTheWayToPickup,
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: MyButton(
                                    title: S.of(context).changeSupplier,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => ChangeSupplierWidget(
                                          onTap: () {
                                            logger.i(orderModel.status);
                                            cubit
                                                .rejectOffer(
                                              orderId: orderModel.id.toString(),
                                              offerId: offerModel.id.toString(),
                                            )
                                                .then((value) {
                                              if (context.mounted) {
                                                context.pushNamedAndRemoveUntil(
                                                  Routes.findDriver,
                                                  arguments: orderModel,
                                                      (route) =>
                                                  route.settings.name ==
                                                      Routes.home,
                                                );
                                              }
                                            });
                                          },
                                        ),
                                      );
                                    },
                                    textColor: Colors.black,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: 20.height),
                   SliverToBoxAdapter(child: DriverDetails(model: offerModel,)),
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
