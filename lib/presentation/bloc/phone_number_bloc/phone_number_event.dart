import 'package:equatable/equatable.dart';

abstract class PhoneNumberEvent extends Equatable{}

class SendOtpEvent extends PhoneNumberEvent {
  final String phoneNumber;
  final String countryCode;

  SendOtpEvent({required this.phoneNumber, required this.countryCode});

  @override
  List<Object?> get props => [phoneNumber, countryCode];
}

class VerifyOtpEvent extends PhoneNumberEvent {
  final String otpCode;
  final String phoneNumber;

  VerifyOtpEvent({ required this.otpCode,required this.phoneNumber});

  @override
  List<Object?> get props => [otpCode,phoneNumber];
}