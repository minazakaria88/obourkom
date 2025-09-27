part of 'rating_cubit.dart';

enum RateDriverStatus { initial, loading, success, failure }

extension RateDriverStatusX on RatingState {
  bool get isRateDriverLoading => rateDriverStatus == RateDriverStatus.loading;
  bool get isRateDriverSuccess => rateDriverStatus == RateDriverStatus.success;
  bool get isRateDriverFailure => rateDriverStatus == RateDriverStatus.failure;
}

class RatingState extends Equatable {
  final  RateDriverStatus? rateDriverStatus;
  final  String? errorMessage;
  const RatingState({this.rateDriverStatus, this.errorMessage});

  RatingState copyWith({
    RateDriverStatus? rateDriverStatus,
    String? errorMessage,
  }) {
    return RatingState(
      rateDriverStatus: rateDriverStatus ?? this.rateDriverStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [rateDriverStatus, errorMessage];
}
