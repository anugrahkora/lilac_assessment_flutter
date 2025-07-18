import 'package:equatable/equatable.dart';

abstract class PhoneNumberState extends Equatable {}

class PhoneNumberInitialState extends PhoneNumberState {
  @override
  List<Object?> get props => [];
}

class OtpSendingState extends PhoneNumberState {
  @override
  List<Object?> get props => [];
}

class OtpSentSuccessState extends PhoneNumberState {
  @override
  List<Object?> get props => [];
}


class OtpStopLoadingState extends PhoneNumberState {
  @override
  List<Object?> get props => [];
}
class OtpErrorState extends PhoneNumberState {
  final String errorMessage;

  OtpErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class OtpVerfificationState extends PhoneNumberState {
  @override
  List<Object?> get props => [];
}

class OtpVerificationSuccessState extends PhoneNumberState {
  final Map<String, dynamic> response;

  OtpVerificationSuccessState({required this.response});
  @override
  List<Object?> get props => [];
}

class OtpStopVerificationState extends PhoneNumberState {
  @override
  List<Object?> get props => [];
}
