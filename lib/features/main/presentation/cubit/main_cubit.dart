import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/functions/concatenate_placemark.dart';
import 'package:oborkom/core/helpers/cache_helper.dart';
import '../../../../core/functions/determine_position.dart';
import '../../../../core/functions/get_places_mark.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(location: ''));

  void getUserCurrentLocation() async {
    log('getUserCurrentLocation');
    try {
      emit(state.copyWith(getLocationState: GetLocationState.loading));
      Position currentPosition = await determinePosition();
      log('${currentPosition.latitude}, ${currentPosition.longitude}');
      final addresses = await getAddressFromLatAndLng(
        LatLng(currentPosition.latitude, currentPosition.longitude),
      );
      CacheHelper.saveData(key: CacheHelperKeys.locationEnabled, value: true);
      emit(
        state.copyWith(
          getLocationState: GetLocationState.success,
          location:concatenatePlacemark(place: addresses.first) ?? '',
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
