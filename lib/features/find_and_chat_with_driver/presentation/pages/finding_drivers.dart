import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/loading_widget.dart';
import 'package:oborkom/core/widgets/my_app_bar.dart';
import 'package:oborkom/features/find_and_chat_with_driver/presentation/cubit/find_and_chat_with_driver_cubit.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';
import '../../../orders/data/models/submit_order_model.dart';
import '../widgets/finding_driver_widgets/driver_details_widget.dart';
import '../widgets/finding_driver_widgets/order_details_widget.dart';
import '../widgets/finding_driver_widgets/order_timer_widget.dart';

class FindingDriversScreen extends StatelessWidget {
  const FindingDriversScreen({super.key, required this.model});
  final SubmitOrderModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).findingDrivers),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child:
            BlocBuilder<FindAndChatWithDriverCubit, FindAndChatWithDriverState>(
              builder: (context, state) {
                final cubit = context.read<FindAndChatWithDriverCubit>();
                final offers = state.offers ?? [];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      20.height,
                      OrderDetailsWidget(model: model),
                      20.height,
                      if (offers.isEmpty) OrderTimerWidget(model: model),

                      BlocListener<
                        FindAndChatWithDriverCubit,
                        FindAndChatWithDriverState
                      >(
                        listenWhen: (previous, current) =>
                            previous.acceptOfferStatus !=
                                current.acceptOfferStatus ||
                            previous.rejectOfferStatus !=
                                current.rejectOfferStatus,
                        listener: (context, state) {
                          if (state.acceptOfferStatus ==AcceptOfferStatus.success )
                            {

                              context.pushReplacementNamed(
                                Routes.orderDetails,
                                arguments: {
                                  'cubit': context
                                      .read<FindAndChatWithDriverCubit>(),
                                  'order': model,
                                  'driver': state.selectedOffer,
                                },
                              );
                            }
                        },
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: offers.length,
                          itemBuilder: (context, index) =>
                              BlocSelector<
                                FindAndChatWithDriverCubit,
                                FindAndChatWithDriverState,
                                bool
                              >(
                                selector: (state) {
                                  return (state.acceptOfferStatus ==
                                              AcceptOfferStatus.loading ||
                                          state.rejectOfferStatus ==
                                              RejectOfferStatus.loading) &&
                                      state.selectedOfferId ==
                                          offers[index].id.toString();
                                },
                                builder: (context, isLoading) {
                                  return Stack(
                                    children: [
                                      DriverDetailsWidget(
                                        model: offers[index],
                                        accept: () {
                                          cubit.assignOffer(offers[index]);
                                          cubit.acceptOffer(
                                            orderId: model.id.toString(),
                                            offerId: offers[index].id
                                                .toString(),
                                          );
                                        },
                                        decline: () {
                                          cubit.rejectOffer(
                                            orderId: model.id.toString(),
                                            offerId: offers[index].id
                                                .toString(),
                                          );
                                        },
                                      ),
                                      if (isLoading) const LoadingWidget(),
                                    ],
                                  );
                                },
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      ),
      bottomNavigationBar: SafeArea(
        child: TextButton(
          onPressed: () {
            context.read<FindAndChatWithDriverCubit>().cancelTimer();
            context.pop();
          },
          child: Text(
            S.of(context).cancelOrder,
            style: AppTextStyles.regular16Black.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
