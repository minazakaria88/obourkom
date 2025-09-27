part of 'otp_cubit.dart';

enum VerifyOtpStatus { initial, loading, success, error }

enum ResendOtpStatus { initial, loading, success, error }

extension CheckStatus on OtpState {
  bool get loadingVerifyOtp => otpStatus == VerifyOtpStatus.loading;
  bool get successVerifyOtp => otpStatus == VerifyOtpStatus.success;
  bool get failureVerifyOtp => otpStatus == VerifyOtpStatus.error;
}

@immutable
class OtpState extends Equatable {
 final VerifyOtpStatus? otpStatus;
 final ResendOtpStatus? resendOtpStatus;
 final Duration? otpTimerDuration;
 final String? errorMessage;

  const OtpState({
    this.otpTimerDuration,
    this.otpStatus,
    this.errorMessage,
    this.resendOtpStatus,
  });

  OtpState copyWith({
    Duration? otpTimerDuration,
    VerifyOtpStatus? otpStatus,
    String? errorMessage,
    ResendOtpStatus? resendOtpStatus,
  }) {
    return OtpState(
      otpTimerDuration: otpTimerDuration ?? this.otpTimerDuration,
      otpStatus: otpStatus ?? this.otpStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      resendOtpStatus: resendOtpStatus ?? this.resendOtpStatus,
    );
  }

  @override
  List<Object?> get props => [
    otpTimerDuration,
    otpStatus,
    errorMessage,
    resendOtpStatus,
  ];
}
