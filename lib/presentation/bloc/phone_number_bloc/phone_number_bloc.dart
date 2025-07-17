import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:lilac_assessment_flutter/data/data_source/phone_number_repository.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_event.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_state.dart';

class PhoneNumberBloc extends Bloc<PhoneNumberEvent, PhoneNumberState> {
  final PhoneNumberRepository phoneNumberRepository;
  PhoneNumberBloc(super.initialState, {required this.phoneNumberRepository}) {
    on<SendOtpEvent>(_sendOtpEvent);
    on<VerifyOtpEvent>(_verifyOtpEvent);
  }
  FutureOr<void> _sendOtpEvent(
    SendOtpEvent event,
    Emitter<PhoneNumberState> emit,
  ) async {
    emit(OtpSendingState());
    try {
      await phoneNumberRepository
          .sendOtp(event.phoneNumber, event.countryCode)
          .then((response) {
            if (response.status == true) {
              emit(OtpSentSuccessState());
            } else {
              emit(OtpErrorState('Failed to send OTP'));
            }
          });
    } catch (e) {
      emit(OtpErrorState(e.toString()));
    } finally {
      emit(OtpStopLoadingState());
    }
  }

  FutureOr<void> _verifyOtpEvent(VerifyOtpEvent event, Emitter<PhoneNumberState> emit) async{
      emit(OtpVerfificationState());
    try {
      await phoneNumberRepository
          .verifyOtp(event.otpCode,event.phoneNumber )
          .then((response) {
           emit(OtpVerificationSuccessState(
            response: response,
           ));
log(response.entries.first.value.toString());

          });
    } catch (e) {
      emit(OtpErrorState(e.toString()));
    } finally {
      emit(OtpStopVerificationState());
    }
  }
}
