import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/functions/concatenate_placemark.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_styles.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/l10n.dart';

class OrderPickLocation extends StatelessWidget {
  const OrderPickLocation({
    super.key,
    required this.location,
    required this.pickedLocation,
  });
  final Placemark? location;
  final LatLng? pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          10.height,
          Center(
            child: Text(
              S.of(context).chooseFromSavedLocations,
              style: const TextStyle(
                color: AppColors.darkMainColor,
                decoration: TextDecoration.underline,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          25.height,
          Text(
            S.of(context).determinedLocation,
            style: AppTextStyles.bold18Black,
          ),
          20.height,
          Text(
            concatenatePlacemark(place: location) ?? '',
            style: const TextStyle(
              color: Color(0xff474747),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          20.height,
          MyButton(
            title: S.of(context).confirmLocation,
            onTap: () {
              context.pop(pickedLocation);
            },
          ),
          10.height,
        ],
      ),
    );
  }
}
