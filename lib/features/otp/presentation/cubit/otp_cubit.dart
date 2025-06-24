import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:oborkom/core/api/failure.dart';
import 'package:oborkom/core/helpers/cache_helper.dart';
import 'package:oborkom/features/otp/data/repositories/otp_repo.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit({required this.otpRepository})
    : super(
        OtpState(
          otpTimerDuration: const Duration(seconds: 60),
          otpStatus: VerifyOtpStatus.initial,
          resendOtpStatus: ResendOtpStatus.initial,
        ),
      );
  final OtpRepository otpRepository;

  Timer? _timer;
  void startTimerDuration() {
    log('startTimerDuration');
    _timer?.cancel();
    emit(state.copyWith(otpTimerDuration: const Duration(seconds: 60)));
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (state.otpTimerDuration == Duration.zero) {
        timer.cancel();
      } else {
        emit(
          state.copyWith(otpTimerDuration: state.otpTimerDuration! - oneSec),
        );
      }
    });
  }

  void verifyOtp({required String otp, required String phoneNumber}) async {
    try {
      _timer?.cancel();
      emit(state.copyWith(otpStatus: VerifyOtpStatus.loading));
      // await otpRepository.verifyOtp(otp: otp, phoneNumber: phoneNumber);
      await Future.delayed(const Duration(seconds: 2));
      await CacheHelper.saveData(key: CacheHelperKeys.verified, value: true);
      emit(state.copyWith(otpStatus: VerifyOtpStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          otpStatus: VerifyOtpStatus.error,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          otpStatus: VerifyOtpStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void resendOtp({required String phoneNumber}) async {
    try {
      emit(state.copyWith(resendOtpStatus: ResendOtpStatus.loading));
      await otpRepository.resendOtp(phoneNumber: phoneNumber);
      emit(state.copyWith(resendOtpStatus: ResendOtpStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          resendOtpStatus: ResendOtpStatus.error,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          resendOtpStatus: ResendOtpStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
