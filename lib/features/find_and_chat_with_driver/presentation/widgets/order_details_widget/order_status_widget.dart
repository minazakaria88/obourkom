import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/features/find_and_chat_with_driver/presentation/cubit/find_and_chat_with_driver_cubit.dart';

import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import 'order_stepper_widget.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindAndChatWithDriverCubit, FindAndChatWithDriverState>(
      buildWhen: (previous, current) =>
          previous.orderStatus != current.orderStatus,
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderStepperWidget(
                isActive: state.orderStatus == 'pending',
                title: S.of(context).onYourWay,
                image: Assets.imagesDriverOnWay,
              ),
              const Expanded(
                child: SizedBox(
                  height: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: DottedLine(alignment: WrapAlignment.center),
                  ),
                ),
              ),
              OrderStepperWidget(
                isActive: state.orderStatus == 'inWay',
                title: S.of(context).theDriverHasArrived,
                image: Assets.imagesDriverArrive,
              ),
              const Expanded(
                child: SizedBox(
                  height: 100,
                  child: Align(
                    alignment: Alignment.center,
                    child: DottedLine(),
                  ),
                ),
              ),
              OrderStepperWidget(
                isActive: state.orderStatus == 'completed',
                title: S.of(context).theShipmentHasArrived,
                image: Assets.imagesShipmentArrive,
              ),
            ],
          ),
        );
      },
    );
  }
}
