import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oborkom/features/rating/data/repositories/rating_repo.dart';

import '../../../../core/api/failure.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit({required this.ratingRepository}) : super(RatingState());

  final RatingRepository ratingRepository;

  final formKey = GlobalKey<FormState>();


  void rateDriver(double rate)async {
    try {
      emit(state.copyWith(rateDriverStatus: RateDriverStatus.loading));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(rateDriverStatus: RateDriverStatus.success));
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          rateDriverStatus: RateDriverStatus.failure,
          errorMessage: e.failure.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          rateDriverStatus: RateDriverStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
