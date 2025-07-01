part of 'main_cubit.dart';

enum GetLocationState { loading, success, failure }




extension MainStateX on MainState {}

class MainState extends Equatable {
  GetLocationState? getLocationState;
  String? location;
  CategoriesModel? categoriesModel;
  String? errorMessage;
  SliderModel?  sliderModel;
  List<CarModel> ? cars;

  MainState({
    this.getLocationState,
    this.location,
    this.categoriesModel,
    this.errorMessage,
    this.sliderModel,
    this.cars
  });

  MainState copyWith({
    GetLocationState? getLocationState,
    String? location,
    CategoriesModel? categoriesModel,
    String? errorMessage,
    SliderModel? sliderModel,
    List<CarModel> ? cars
  }) {
    return MainState(
      getLocationState: getLocationState ?? this.getLocationState,
      location: location ?? this.location,
      categoriesModel: categoriesModel ?? this.categoriesModel,
      errorMessage: errorMessage ?? this.errorMessage,
        sliderModel: sliderModel ?? this.sliderModel,
      cars: cars?? this.cars
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
  ];
}
