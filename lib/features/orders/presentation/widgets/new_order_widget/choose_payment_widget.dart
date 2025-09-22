import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/orders/presentation/widgets/new_order_widget/payment_item_widget.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/orders_cubit.dart';

class ChoosePaymentWidget extends StatelessWidget {
  const ChoosePaymentWidget({super.key, required this.cubit});

  final OrdersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.height,
          PaymentItemWidget(
            onTap: () {
              cubit.pickPaymentMethod(S.of(context).card);
              context.pop();
            },
            title: S.of(context).card,
            image: Assets.imagesMastercardLogo,
          ),
          PaymentItemWidget(
            onTap: () {
              cubit.pickPaymentMethod(S.of(context).mada);
              context.pop();
            },
            title: S.of(context).mada,
            image: Assets.imagesMadaLogo,
          ),
          PaymentItemWidget(
            onTap: () {
              cubit.pickPaymentMethod(S.of(context).applePay);
              context.pop();
            },
            title: S.of(context).applePay,
            image: Assets.imagesApple,
          ),

          20.height,
        ],
      ),
    );
  }
}
