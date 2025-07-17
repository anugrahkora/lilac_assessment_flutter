import 'dart:convert';

import 'package:lilac_assessment_flutter/data/config/config.dart';
import 'package:lilac_assessment_flutter/data/network/network.dart';
import 'package:lilac_assessment_flutter/domain/entities/otp_send_response.dart';

class PhoneNumberRepository {
  final NetworkUtil networkUtil;

  PhoneNumberRepository({required this.networkUtil});

  Future<OtpSentResponse> sendOtp(
    String phoneNumber,
    String countryCode,
  ) async {
    try {
     final response = await networkUtil.post(
      url: AppConfig.sendOtpEndpoint,
      body: {
        "data": {
          "type": "registration_otp_codes",
          "attributes": {"phone": "$countryCode $phoneNumber"},
        },
      },
    );

    if (response.statusCode == 200) {
final data=jsonDecode(response.body);

      return OtpSentResponse.fromJson(data);
    } else {
      throw Exception('Failed to send OTP');
    }
    } catch (e) {
      throw Exception('Failed to send OTP: $e');
    }
    
  }
}
