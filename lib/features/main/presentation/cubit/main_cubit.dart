import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oborkom/core/functions/concatenate_placemark.dart';
import 'package:oborkom/core/helpers/cache_helper.dart';
import 'package:oborkom/features/main/data/models/car_model.dart';
import 'package:oborkom/features/main/data/models/slider_model.dart';
import 'package:oborkom/features/main/data/models/truck_size.dart';
import 'package:oborkom/features/main/data/repositories/main_repo.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/functions/determine_position.dart';
import '../../../../core/functions/get_places_mark.dart';
import '../../../../core/utils/constant.dart';
import '../../data/models/categories_model.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({required this.mainRepository}) : super(MainState(location: ''));
  final MainRepository mainRepository;

  void getUserCurrentLocation() async {
    try {
      emit(state.copyWith(getLocationState: GetLocationState.loading));
      Position currentPosition = await determinePosition();
      logger.i(currentPosition);
      final addresses = await getAddressFromLatAndLng(
        LatLng(currentPosition.latitude, currentPosition.longitude),
      );
     await CacheHelper.saveData(key: CacheHelperKeys.locationEnabled, value: true);
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

  void getCategories() async {
    try {
      final result = await mainRepository.getCategories();
      emit(state.copyWith(categoriesModel: result));
    } on ApiException catch (e) {
      emit(state.copyWith(errorMessage: e.failure.message));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void getSlider() async {
    try {
      final result = await mainRepository.getSlider();
      emit(state.copyWith(sliderModel: result));
    } on ApiException catch (e) {
      emit(state.copyWith(errorMessage: e.failure.message));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void getCars() async {
    try {
      emit(state.copyWith(getCarsState: GetCarsState.loading));
      final response = await mainRepository.getTruckSize();
      emit(state.copyWith(cars: response, getCarsState: GetCarsState.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.failure.message,
          getCarsState: GetCarsState.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          getCarsState: GetCarsState.failure,
        ),
      );
    }
  }
}
