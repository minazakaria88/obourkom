part of 'main_cubit.dart';

enum GetLocationState { loading, success, failure }

enum GetCarsState { loading, success, failure }

extension MainStateX on MainState {}

class MainState extends Equatable {
  GetLocationState? getLocationState;
  String? location;
  CategoriesModel? categoriesModel;
  String? errorMessage;
  SliderModel? sliderModel;
  List<CarModel>? cars;
  GetCarsState? getCarsState;

  MainState({
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
    List<CarModel>? cars,
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
