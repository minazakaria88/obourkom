import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/core/functions/determine_position.dart';
import 'package:oborkom/core/functions/get_places_mark.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/locations/data/models/location_model.dart';
import 'package:oborkom/features/locations/data/repositories/location_repo.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit({required this.locationRepository}) : super(LocationsState());
  final LocationRepository locationRepository;

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  void changeCameraPosition(LatLng position) async {
    controller.future
        .then((value) => value.animateCamera(CameraUpdate.newLatLng(position)))
        .catchError((e) {});
  }

  void getUserCurrentLocation() async {
    try {
      log('getUserCurrentLocation');
      final userLocation = await determinePosition();
      final locationData = await getAddressFromLatAndLng(
        LatLng(userLocation.latitude, userLocation.longitude),
      );
      logger.i(userLocation);
      changeCameraPosition(
        LatLng(userLocation.latitude, userLocation.longitude),
      );
      emit(
        state.copyWith(
          locationData: locationData.first,
          pickedLocation: LatLng(userLocation.latitude, userLocation.longitude),
        ),
      );
    } catch (e) {
      log('getUserCurrentLocation : ${e.toString()}');
    }
  }

  void pickUserLocation(LatLng position) async {
    final locationData = await getAddressFromLatAndLng(position);
    changeCameraPosition(position);
    emit(
      state.copyWith(
        pickedLocation: LatLng(position.latitude, position.longitude),
        locationData: locationData.first,
      ),
    );
  }

  void getLocations() async {
    try {
      emit(state.copyWith(locationsStatus: LocationsStatus.loading));
      final result = await locationRepository.getLocations();
      emit(
        state.copyWith(
          locationsStatus: LocationsStatus.success,
          locations: result,
        ),
      );
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          locationsStatus: LocationsStatus.error,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          locationsStatus: LocationsStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void postLocations(LocationModel model) async {
    try {
      emit(state.copyWith(postLocationState: PostLocationState.loading));
      await locationRepository.postAddresses(model);
      logger.i(model.toJson());
      emit(state.copyWith(postLocationState: PostLocationState.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          postLocationState: PostLocationState.error,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          postLocationState: PostLocationState.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void deleteLocation(int id) async {
    try {
      await locationRepository.deleteAddress(id);
      final location = state.locations!.where((element) => element.id != id);
      emit(state.copyWith(deleteLocationState: DeleteLocationState.success,locations: location.toList()));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          deleteLocationState: DeleteLocationState.error,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleteLocationState: DeleteLocationState.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void selectLocationType(int locationType) {
    emit(state.copyWith(locationType: locationType));
  }
}
