import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lilac_assessment_flutter/data/data_source/phone_number_repository.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_event.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_state.dart';

class PhoneNumberBloc extends Bloc<PhoneNumberEvent, PhoneNumberState> {
  final PhoneNumberRepository phoneNumberRepository;
  PhoneNumberBloc(super.initialState, {required this.phoneNumberRepository}) {
    on<SendOtpEvent>(_sendOtpEvent);
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
}
