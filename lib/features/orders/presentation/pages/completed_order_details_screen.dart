import 'package:flutter/material.dart';

import '../../../../core/widgets/my_app_bar.dart';
import '../../../../generated/l10n.dart';

class CompletedOrderDetailsScreen extends StatelessWidget {
  const CompletedOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).orderDetails),
    );
  }
}
