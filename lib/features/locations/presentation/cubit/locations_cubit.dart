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
import 'package:oborkom/core/helpers/location_service.dart';
import 'package:oborkom/core/utils/constant.dart';
import 'package:oborkom/features/locations/data/models/location_model.dart';
import 'package:oborkom/features/locations/data/repositories/location_repo.dart';

import '../../data/models/auto_complete_location_model.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit({required this.locationRepository}) : super(const LocationsState());
  final LocationRepository locationRepository;

  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  void changeCameraPosition(LatLng position) async {
    controller.future
        .then((value) => value.animateCamera(CameraUpdate.newLatLng(position)))
        .catchError((e) {});
  }

  void getUserCurrentLocation() async {
    try {
      logger.i('getUserCurrentLocation');
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
        pickedLocation: position,
        locationData: locationData.first,
        isShowPickerWidget: true,
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
      emit(
        state.copyWith(
          deleteLocationState: DeleteLocationState.success,
          locations: location.toList(),
        ),
      );
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

  void getAutoCompleteLocation() async {
    try {
      emit(state.copyWith(isShowPickerWidget: false));
      final data = {
        'key': LocationService.key,
        'input': searchController.text,
        'components': 'country:sa|country:eg',
      };
      final result = await locationRepository.getAuCompleteLocations(data);
      if (result.isEmpty) {
        emit(
          state.copyWith(
            autoCompleteLocations: result,
            isShowPickerWidget: true,
          ),
        );
      } else {
        emit(state.copyWith(autoCompleteLocations: result));
      }
    } on ApiException catch (e) {
      emit(state.copyWith(errorMessage: e.failure.message));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void getDetailsLocation(String placeId) async {
    try {
      final data = {'key': LocationService.key, 'place_id': placeId};
      emit(state.copyWith(autoCompleteLocations: []));
      final result = await locationRepository.getDetailsLocation(data);
      final location = result.result!.geometry!.location!;
      pickUserLocation(LatLng(location.lat!, location.lng!));
    } on ApiException catch (e) {
      emit(state.copyWith(errorMessage: e.failure.message));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    nameController.dispose();
    controller.future.then((value) => value.dispose());
    return super.close();
  }
}
