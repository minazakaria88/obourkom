import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';
import 'order_details_item_widget.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ExpansionTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Text(
            S.of(context).orderDetails,
            style: AppTextStyles.bold18Black,
          ),
          children: [
            OrderDetailsItemWidget(
              value: '#100',
              title: S.of(context).orderNumber,
            ),
            OrderDetailsItemWidget(
              value: 'نقل أثاث',
              title: S.of(context).serviceType,
            ),
            OrderDetailsItemWidget(
              value: 'كبيرة',
              title: S.of(context).carType,
            ),
            OrderDetailsItemWidget(
              value: 'أبل باي',
              title: S.of(context).paymentMethod,
            ),
          ],
        ),
      ),
    );
  }
}
