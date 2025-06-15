part of 'main_cubit.dart';

enum GetLocationState{
  loading,
  success,
  failure
}

 class MainState  extends Equatable{
  GetLocationState ? getLocationState;
  String ? location;

  MainState({this.getLocationState, this.location});


  MainState copyWith({
    GetLocationState? getLocationState,
    String? location,
  }) {
    return MainState(
      getLocationState: getLocationState ?? this.getLocationState,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [getLocationState, location];
}
