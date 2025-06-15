import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/locations/presentation/cubit/locations_cubit.dart';
import 'package:oborkom/features/locations/presentation/widgets/picked_location_widgets/add_new_location_widget.dart';
import 'package:oborkom/generated/l10n.dart';
import '../../../../core/widgets/my_app_bar.dart';
import '../../../../generated/assets.dart';
import '../widgets/picked_location_widgets/order_picked_location_widget.dart';

class PickOrderLocationScreen extends StatefulWidget {
  const PickOrderLocationScreen({super.key, required this.mapContext});

  final MapContext mapContext;

  @override
  State<PickOrderLocationScreen> createState() =>
      _PickOrderLocationScreenState();
}

class _PickOrderLocationScreenState extends State<PickOrderLocationScreen> {
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
      appBar: MyAppBar(
        title: widget.mapContext.type == MapTypes.addLocation
            ? S.of(context).addAddress
            : S.of(context).request,
      ),
      body: BlocBuilder<LocationsCubit, LocationsState>(
        buildWhen: (previous, current) =>
            previous.pickedLocation != current.pickedLocation,
        builder: (context, state) {
          final cubit = context.read<LocationsCubit>();
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GoogleMap(
                markers: {
                  if (state.pickedLocation != null && isMarkerSet)
                    Marker(
                      markerId: const MarkerId('1'),
                      position: state.pickedLocation!,
                      icon: markerIcon,
                    ),
                },
                onTap: (position) {
                  cubit.pickUserLocation(position);
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
              ),
              if (state.pickedLocation != null)
                widget.mapContext.type == MapTypes.orderPick
                    ? OrderPickLocation(
                        location: state.locationData,
                        pickedLocation: state.pickedLocation,
                      )
                    : AddNewLocationWidget(
                        location: state.locationData,
                        pickedLocation: state.pickedLocation,
                      ),
            ],
          );
        },
      ),
    );
  }
}
