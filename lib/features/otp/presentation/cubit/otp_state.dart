part of 'otp_cubit.dart';

enum VerifyOtpStatus { initial, loading, success, error }
enum ResendOtpStatus { initial, loading, success, error }

extension CheckStatus on OtpState
{
  bool get loadingVerifyOtp => otpStatus==VerifyOtpStatus.loading;
  bool get successVerifyOtp => otpStatus==VerifyOtpStatus.success;
  bool get failureVerifyOtp => otpStatus==VerifyOtpStatus.error;


}


class OtpState {
  VerifyOtpStatus? otpStatus;
  ResendOtpStatus ?resendOtpStatus;
  Duration? otpTimerDuration;
  String? errorMessage;


  OtpState({this.otpTimerDuration, this.otpStatus, this.errorMessage,this.resendOtpStatus});

  OtpState copyWith({
    Duration? otpTimerDuration,
    VerifyOtpStatus? otpStatus,
    String? errorMessage,
    ResendOtpStatus ?resendOtpStatus
  }) {
    return OtpState(
      otpTimerDuration: otpTimerDuration ?? this.otpTimerDuration,
      otpStatus: otpStatus ?? this.otpStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      resendOtpStatus: resendOtpStatus ?? this.resendOtpStatus
    );
  }
}
