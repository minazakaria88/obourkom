import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/main/data/models/categories_model.dart';
import 'package:oborkom/features/main/presentation/widgets/car_widget.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/my_app_bar.dart';

class ChooseCarScreen extends StatelessWidget {
  const ChooseCarScreen({
    super.key,
    required this.cars,
    required this.servicesName,
  });
  final List<TruckModel> cars;
  final String servicesName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).transportOfGoods),
      body: cars.isEmpty
          ? Center(
              child: Text(
                S.of(context).noTrucks,
                style: AppTextStyles.bold14MainColor.copyWith(fontSize: 20),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: cars.length,
              itemBuilder: (context, index) => TruckItem(
                truck: cars[index],
                onTap: () {
                  context.pushReplacementNamed(
                    Routes.newOrder,
                    arguments: {
                      'truckModel': cars[index],
                      'serviceName': servicesName,
                    },
                  );
                },
              ),
            ),
    );
  }
}
