import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../widgets/completed_orders_widgets/driver_widget.dart';
import '../widgets/completed_orders_widgets/invoice_and_evaluation.dart';
import '../widgets/completed_orders_widgets/order_details.dart';
import '../widgets/completed_orders_widgets/order_notes_widget.dart';
import '../widgets/completed_orders_widgets/payment_summary.dart';

class CompletedOrderDetailsScreen extends StatelessWidget {
  const CompletedOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).orderDetails),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CompleteOrderDetailsWidget(),
                  20.height,
                  const CompleteOrderNotesWidget(),
                  20.height,
                  const CompleteOrderDriverWidget(),
                  20.height,
                  const CompleteOrderPaymentSummaryWidget(),
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
