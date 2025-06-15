import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../data/models/car_model.dart';

class ChooseCarScreen extends StatelessWidget {
  const ChooseCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).transportOfGoods),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: carList
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildItem(e, () {
                      context.pushNamed(Routes.newOrder);
                    }),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(CarModel e, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 140,
        width: 140,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withAlpha((0.1 * 255).toInt()),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(e.image, fit: BoxFit.fill),
            10.height,
            Flexible(
              child: Text(
                e.name,
                style: const TextStyle(
                  color: AppColors.darkMainColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

