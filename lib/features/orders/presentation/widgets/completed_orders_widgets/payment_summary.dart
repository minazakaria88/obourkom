import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../find_and_chat_with_driver/presentation/widgets/finding_driver_widgets/order_details_item_widget.dart';
import '../../../../profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';

class CompleteOrderPaymentSummaryWidget extends StatelessWidget {
  const CompleteOrderPaymentSummaryWidget({
    super.key, required this.model,
  });
  final OrderDataModel model;

  @override
  Widget build(BuildContext context) {
    return BackgroundProfileWidget(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).paymentSummary,
              style: AppTextStyles.bold18Black,
            ),
            const Divider(thickness: 1.2, color: Colors.grey),
            OrderDetailsItemWidget(
              value: '${0.00} ${S.of(context).sar} ',
              title: S.of(context).orderValue,
            ),
            OrderDetailsItemWidget(
              value: ' ${model.price ?? ''} ${S.of(context).sar} ',
              title: S.of(context).shipmentValue,
            ),
            OrderDetailsItemWidget(
              value: ' ${0.00} ${S.of(context).sar} ',
              title: S.of(context).discount,
            ),
            const Divider(thickness: 1.2, color: Colors.grey),
            5.height,
            OrderDetailsItemWidget(
              title: S.of(context).total,
              value: ' ${model.price ?? ''} ${S.of(context).sar} ',
            ),
          ],
        ),
      ),
    );
  }
}
