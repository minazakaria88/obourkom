import 'package:flutter/material.dart';

import '../../../../../core/widgets/my_app_bar.dart';
import '../../../../../generated/l10n.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).aboutUs),
    );
  }
}
