import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/my_app_bar.dart';
import 'package:oborkom/generated/l10n.dart';

import '../../../../core/routes/routes.dart';
import '../../../../generated/assets.dart';
import '../../data/models/categories_model.dart';
import '../widgets/choose_type_widget.dart';

class ChooseTypeScreen extends StatelessWidget {
  const ChooseTypeScreen({
    super.key,
    required this.serviceName,
    required this.model,
  });
  final String serviceName;
  final TruckModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).type),
      body: Column(
        children: [
          20.height,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ChooseTypeWidget(
                    image: Assets.imagesBokking,
                    onTap: () {
                      context.pushReplacementNamed(
                        Routes.newOrder,
                        arguments: {
                          'truckModel': model,
                          'serviceName': serviceName,
                          'type': 'later',
                        },
                      );
                    },
                  ),
                  20.height,
                  ChooseTypeWidget(
                    image: Assets.imagesRightNow,
                    onTap: () {
                      context.pushReplacementNamed(
                        Routes.newOrder,
                        arguments: {
                          'truckModel': model,
                          'serviceName': serviceName,
                          'type': 'now',
                        },
                      );
                    },
                  ),

                  20.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
