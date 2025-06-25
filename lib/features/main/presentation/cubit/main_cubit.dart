import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/functions/concatenate_placemark.dart';
import 'package:oborkom/core/helpers/cache_helper.dart';
import 'package:oborkom/features/main/data/models/car_model.dart';
import 'package:oborkom/features/main/data/repositories/main_repo.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/functions/determine_position.dart';
import '../../../../core/functions/get_places_mark.dart';
import '../../../../core/utils/constant.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../../main.dart';
import '../../data/models/services_model.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({required this.mainRepository}) : super(MainState(location: ''));
  final MainRepository mainRepository;

  void getUserCurrentLocation() async {
    log('getUserCurrentLocation');
    try {
      emit(state.copyWith(getLocationState: GetLocationState.loading));
      Position currentPosition = await determinePosition();
      logger.i(currentPosition);
      final addresses = await getAddressFromLatAndLng(
        LatLng(currentPosition.latitude, currentPosition.longitude),
      );
      CacheHelper.saveData(key: CacheHelperKeys.locationEnabled, value: true);
      emit(
        state.copyWith(
          getLocationState: GetLocationState.success,
          location: concatenatePlacemark(place: addresses.first) ?? '',
        ),
      );
    } catch (e) {
      logger.e(e);
      emit(state.copyWith(getLocationState: GetLocationState.failure));
    }
  }

  void getService() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      // final response = await mainRepository.getService();
      emit(state.copyWith(servicesList: servicesList));
    } on ApiException catch (e) {
      emit(state.copyWith(errorMessage: e.failure.message));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void getSlider() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
     // final response = await mainRepository.getSlider();
      emit(state.copyWith(sliderList: [
        Assets.imagesLogo,
        Assets.imagesSmallCar,
        Assets.imagesFurniture,
      ]));
    } on ApiException catch (e) {
      emit(state.copyWith(errorMessage: e.failure.message));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void getCars()async
  {
    try {
      await Future.delayed(const Duration(seconds: 5));
       final response = await mainRepository.getCars();
      emit(state.copyWith(cars: [
        CarModel(
          id: 1,
          name: S.of(NavigatorClass.navigatorKey.currentState!.context).smallCars,
          type: 1,
          image: Assets.imagesSmallCar,
        ),
        CarModel(
          id: 2,
          name: S.of(NavigatorClass.navigatorKey.currentState!.context).bigCars,
          type: 2,
          image: Assets.imagesBigCar,
        ),
      ]));
    } on ApiException catch (e) {
      emit(state.copyWith(errorMessage: e.failure.message));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

}
