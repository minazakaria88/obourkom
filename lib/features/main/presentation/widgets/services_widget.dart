import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_colors.dart';
import 'package:oborkom/features/main/data/models/services_model.dart';
import 'package:oborkom/generated/assets.dart';
import 'choose_your_services.dart';
import 'image_slider.dart';
import 'one_services_widget.dart';

class MyServicesWidget extends StatelessWidget {
  const MyServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
               const ImageSlider(
                images: [
                  Assets.imagesLogo,
                  Assets.imagesSmallCar,
                  Assets.imagesFurniture,
                ], colors: [
                  Colors.white,
                AppColors.mainColor,
                 Colors.white,


               ],
              ),
              20.height,
              const ChooseYourServices(),
              10.height,
            ],
          ),
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemCount: servicesList.length,
          itemBuilder: (context, index) =>
              OneServicesWidget(model: servicesList[index]),
        ),
      ],
    );
  }
}
