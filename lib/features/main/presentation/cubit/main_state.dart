part of 'main_cubit.dart';

enum GetLocationState { loading, success, failure }

enum GetCarsState { loading, success, failure }

extension MainStateX on MainState {}


@immutable
class MainState extends Equatable {
 final GetLocationState? getLocationState;
 final String? location;
 final CategoriesModel? categoriesModel;
 final String? errorMessage;
 final SliderModel? sliderModel;
 final List<TruckSizeModel>? cars;
 final  GetCarsState? getCarsState;

  const MainState({
    this.getLocationState,
    this.location,
    this.categoriesModel,
    this.errorMessage,
    this.sliderModel,
    this.cars,
    this.getCarsState,
  });

  MainState copyWith({
    GetLocationState? getLocationState,
    String? location,
    CategoriesModel? categoriesModel,
    String? errorMessage,
    SliderModel? sliderModel,
    List<TruckSizeModel>? cars,
    GetCarsState? getCarsState,
  }) {
    return MainState(
      getLocationState: getLocationState ?? this.getLocationState,
      location: location ?? this.location,
      categoriesModel: categoriesModel ?? this.categoriesModel,
      errorMessage: errorMessage ?? this.errorMessage,
      sliderModel: sliderModel ?? this.sliderModel,
      cars: cars ?? this.cars,
      getCarsState: getCarsState ?? this.getCarsState,
    );
  }

  @override
  List<Object?> get props => [
    getLocationState,
    location,
    categoriesModel,
    errorMessage,
    sliderModel,
    cars,
    getCarsState,
  ];
}
