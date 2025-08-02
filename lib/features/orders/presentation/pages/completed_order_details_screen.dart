import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/orders/data/models/order_model.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../widgets/completed_orders_widgets/driver_widget.dart';
import '../widgets/completed_orders_widgets/invoice_and_evaluation.dart';
import '../widgets/completed_orders_widgets/order_details.dart';
import '../widgets/completed_orders_widgets/order_notes_widget.dart';
import '../widgets/completed_orders_widgets/payment_summary.dart';

class CompletedOrderDetailsScreen extends StatelessWidget {
  const CompletedOrderDetailsScreen({super.key, required this.model});
    final OrderDataModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).orderDetails),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              left: 12,
              right: 12,
              bottom: 100,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                   CompleteOrderDetailsWidget(model: model,),
                  20.height,
                   CompleteOrderNotesWidget(notes: model.notes??'',),
                  20.height,
                   CompleteOrderDriverWidget(driver: model.driver!),
                  20.height,
                   CompleteOrderPaymentSummaryWidget(model: model,),
                ],
              ),
            ),
          ),
          const CompleteOrderInvoiceAndEvaluationWidget(),
        ],
      ),
    );
  }
}
