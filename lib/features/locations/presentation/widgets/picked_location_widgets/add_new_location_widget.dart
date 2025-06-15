import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/functions/concatenate_placemark.dart';
import 'package:oborkom/core/helpers/extension.dart';
import 'package:oborkom/core/utils/app_styles.dart';
import 'package:oborkom/features/locations/presentation/cubit/locations_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/my_button.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import 'choose_location_type_widget.dart';

class AddNewLocationWidget extends StatelessWidget {
  const AddNewLocationWidget({
    super.key,
    required this.location,
    required this.pickedLocation,
  });
  final Placemark? location;
  final LatLng? pickedLocation;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LocationsCubit>();
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
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).determinedLocation,
              style: AppTextStyles.bold18Black,
            ),
            10.height,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.mainColor),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.imagesLocation),
                  10.width,
                  Flexible(
                    child: Text(
                      concatenatePlacemark(place: location) ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular12Grey,
                    ),
                  ),
                ],
              ),
            ),
            15.height,
            Text(S.of(context).type, style: AppTextStyles.bold18Black),
            10.height,
            const ChooseLocationTypeWidget(),
            10.height,
            MyButton(
              title: S.of(context).save,
              onTap: () {
                if (cubit.formKey.currentState!.validate()) {
                  context.pop(pickedLocation);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

