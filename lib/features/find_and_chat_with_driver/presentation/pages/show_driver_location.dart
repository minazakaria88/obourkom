import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/widgets/my_app_bar.dart';

import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../locations/presentation/cubit/locations_cubit.dart';

class ShowDriverLocation extends StatefulWidget {
  const ShowDriverLocation({super.key});

  @override
  State<ShowDriverLocation> createState() => _ShowDriverLocationState();
}

class _ShowDriverLocationState extends State<ShowDriverLocation> {


  late final BitmapDescriptor markerIcon;
  bool isMarkerSet = false;
  @override
  void initState() {
    super.initState();
    setMarkerIcon();
  }

  void setMarkerIcon() async {
    markerIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(48, 48)),
      Assets.imagesMarker,
    );
    isMarkerSet = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: S.of(context).location),
      body: BlocBuilder<LocationsCubit, LocationsState>(
        builder: (context, state) {
          final cubit = context.read<LocationsCubit>();
         return GoogleMap(
            markers: {
              if (state.pickedLocation != null && isMarkerSet)
                Marker(
                  markerId: const MarkerId('1'),
                  position: state.pickedLocation!,
                  icon: markerIcon,
                ),
            },
            initialCameraPosition: CameraPosition(
              target:
              state.pickedLocation ?? const LatLng(30.0444, 31.2357),
              zoom: 15,
            ),
            onMapCreated: (controller) {
              cubit.controller.complete(controller);
            },
            onCameraMove: (position) {},
            onCameraIdle: () {},
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            padding: const EdgeInsets.all(0),
            buildingsEnabled: true,
            cameraTargetBounds: CameraTargetBounds.unbounded,
            compassEnabled: true,
            indoorViewEnabled: true,
            mapToolbarEnabled: true,
            minMaxZoomPreference: MinMaxZoomPreference.unbounded,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
          );

        },
      ),
    );

  }
}
