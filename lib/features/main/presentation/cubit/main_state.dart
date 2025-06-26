part of 'main_cubit.dart';

enum GetLocationState { loading, success, failure }




extension MainStateX on MainState {}

class MainState extends Equatable {
  GetLocationState? getLocationState;
  String? location;
  List<ServicesModel>? servicesList;
  String? errorMessage;
  List<String>? sliderList;
  List<CarModel> ? cars;

  MainState({
    this.getLocationState,
    this.location,
    this.servicesList,
    this.errorMessage,
    this.sliderList,
    this.cars
  });

  MainState copyWith({
    GetLocationState? getLocationState,
    String? location,
    List<ServicesModel>? servicesList,
    String? errorMessage,
    List<String>? sliderList,
    List<CarModel> ? cars
  }) {
    return MainState(
      getLocationState: getLocationState ?? this.getLocationState,
      location: location ?? this.location,
      servicesList: servicesList ?? this.servicesList,
      errorMessage: errorMessage ?? this.errorMessage,
      sliderList: sliderList ?? this.sliderList,
      cars: cars?? this.cars
    );
  }

  @override
  List<Object?> get props => [
    getLocationState,
    location,
    servicesList,
    errorMessage,
    sliderList,
    cars,
  ];
}
