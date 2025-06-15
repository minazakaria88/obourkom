import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/features/profile/presentation/widgets/profile_screen_widgets/background_profile_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_colors.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.images, required this.colors});

  final List<String> images;
  final List<Color> colors;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.images
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: BackgroundProfileWidget(
                      child: Image.asset(
                        e,
                        //fit: BoxFit.fill,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 190,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        20.height,
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.images.length,
          effect: const WormEffect(
            activeDotColor: AppColors.mainColor,
            dotColor: AppColors.greyColor,
            dotHeight: 10,
            dotWidth: 10,
            strokeWidth: 10,
            spacing: 10,

          ),
        ),
      ],
    );
  }
}
