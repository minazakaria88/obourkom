import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
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
                      offers.isEmpty
                          ? OrderTimerWidget(model: model)
                          : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: offers.length,
                            itemBuilder: (context, index) =>
                                DriverDetailsWidget(
                                  model: offers[index],
                                  accept: () {
                                    cubit.acceptOffer(
                                      orderId: model.id.toString(),
                                      offerId: offers[index].id.toString(),
                                    );
                                    cubit.cancelTimer();
                                    context.pushNamed(
                                      Routes.orderDetails,
                                      arguments: {
                                        'cubit': cubit,
                                        'order': model,
                                        'driver': offers[index],
                                      },
                                    );
                                  },
                                  decline: () {},
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
