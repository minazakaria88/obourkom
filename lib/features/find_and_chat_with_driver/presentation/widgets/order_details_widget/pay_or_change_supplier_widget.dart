import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/loader_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../orders/data/models/submit_order_model.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import '../../../data/models/offer_model.dart';
import '../../cubit/find_and_chat_with_driver_cubit.dart';
import 'change_supplier_widget.dart';

class PayOrChangeSupplier extends StatelessWidget {
  const PayOrChangeSupplier({
    super.key,
    required this.orderModel,
    required this.offerModel,
  });
  final SubmitOrderModel orderModel;
  final OfferModel offerModel;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child:
          BlocConsumer<FindAndChatWithDriverCubit, FindAndChatWithDriverState>(
            listenWhen: (previous, current) =>
                previous.rejectOfferStatus != current.rejectOfferStatus,
            listener: (context, state) {
              if (state.rejectOfferStatus == RejectOfferStatus.success) {
                context.pushNamedAndRemoveUntil(
                  Routes.findDriver,
                  arguments: orderModel,
                  (route) => route.settings.name == Routes.home,
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<FindAndChatWithDriverCubit>();
              return statusToNumber[state.orderStatus] == null ||
                      statusToNumber[state.orderStatus]! > 0
                  ? const SizedBox.shrink()
                  : BackgroundProfileWidget(
                      child: SizedBox(
                        height: 65,
                        child: Row(
                          children: [
                            Expanded(
                              child:
                                  state.changeOrderStatus ==
                                      ChangeOrderStatus.loading
                                  ? const LoaderWidget()
                                  : MyButton(
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
                                    builder: (_) => BlocProvider.value(
                                      value: cubit,
                                      child:
                                          BlocBuilder<
                                            FindAndChatWithDriverCubit,
                                            FindAndChatWithDriverState
                                          >(
                                            buildWhen: (previous, current) =>
                                                previous.rejectOfferStatus !=
                                                current.rejectOfferStatus,
                                            builder: (context, state) {
                                              return Stack(
                                                children: [
                                                  ChangeSupplierWidget(
                                                    onTap: () {
                                                      cubit.rejectOffer(
                                                        orderId: orderModel.id
                                                            .toString(),
                                                        offerId: offerModel.id
                                                            .toString(),
                                                      );
                                                    },
                                                  ),
                                                  if (state.rejectOfferStatus ==
                                                      RejectOfferStatus.loading)
                                                    const LoadingWidget(),
                                                ],
                                              );
                                            },
                                          ),
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
    );
  }
}
