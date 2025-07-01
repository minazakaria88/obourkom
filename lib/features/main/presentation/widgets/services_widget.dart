import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/widgets/shimmer_item.dart';
import '../../../../core/routes/routes.dart';
import '../cubit/main_cubit.dart';
import 'choose_your_services.dart';
import 'image_slider.dart';
import 'one_services_widget.dart';

class MyServicesWidget extends StatelessWidget {
  const MyServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        final servicesList = state.categoriesModel?.data ?? [];
        final sliderList = state.sliderModel?.data ?? [];
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  sliderList.isEmpty
                      ? const ShimmerItem(
                          width: double.infinity,
                          height: 200,
                          margin: 12,
                        )
                      : ImageSlider(
                          images: sliderList
                        ),
                  20.height,
                  const ChooseYourServices(),
                  10.height,
                ],
              ),
            ),

            servicesList.isEmpty
                ? SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: 10,
                    itemBuilder: (context, index) =>
                        const ShimmerItem(width: 0, height: 0, margin: 10),
                  )
                : SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.8,
                        ),
                    itemCount: servicesList.length,
                    itemBuilder: (context, index) => OneServicesWidget(
                      model: servicesList[index],
                      onTap: () {
                        context.pushNamed(
                          Routes.chooseYourCar,
                          arguments: context.read<MainCubit>(),
                        );
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }
}
