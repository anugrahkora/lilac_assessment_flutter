import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_assessment_flutter/core/constants/app_strings/app_strings.dart';
import 'package:lilac_assessment_flutter/core/route/app_routes.dart';
import 'package:lilac_assessment_flutter/core/themes/app_themes.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_bloc.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_event.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_state.dart';
import 'package:lilac_assessment_flutter/presentation/widgets/back_button.dart';
import 'package:lilac_assessment_flutter/presentation/widgets/gradient_cta.dart';
import 'package:lilac_assessment_flutter/presentation/widgets/phone_number_input.dart';

class EnterPhoneNumber extends StatefulWidget {
  const EnterPhoneNumber({super.key});

  @override
  State<EnterPhoneNumber> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  late PhoneNumberBloc _phoneNumberBloc;
  final TextEditingController _phoneController = TextEditingController();
  String _countryCode = '+91'; // Default country code
bool _isOtpSending=false;
  @override
  void initState() {
    _phoneNumberBloc = BlocProvider.of<PhoneNumberBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PhoneNumberBloc, PhoneNumberState>(
          listener: (context, state) {
            if(state is OtpSendingState){
              _isOtpSending=true;
            }
            else if(state is OtpSentSuccessState){
              _isOtpSending=false;
              context.push(AppRoutes.enterOtp, extra: '$_countryCode ${_phoneController.text}');
            }
            else if(state is OtpErrorState){
              _isOtpSending=false;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
            else if(state is OtpStopLoadingState){
              _isOtpSending=false;
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: _isOtpSending,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButtonCustom(),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 48,
                          vertical: 24,
                        ),
                        child: Text(
                          AppStrings.enterPhoneNumber,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    PhoneNumberInput(
                      controller: _phoneController,
                      countryCode: _countryCode,
                      onCountryTap: (code) {
                        _countryCode = code;
                        setState(() {});
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        AppStrings.enterPhoneNumberDescription,
                        style: AppTextStyles.body1,
                      ),
                    ),
                    const Spacer(),
                    GradientCTA(
                      isLoading: _isOtpSending,
                      label: AppStrings.next,
                      onPressed: () {
                        if (_phoneController.text.isNotEmpty &&
                            _countryCode.isNotEmpty) {
                         _phoneNumberBloc.add(
                            SendOtpEvent(
                              phoneNumber: _phoneController.text,
                              countryCode: _countryCode,
                            ),
                          );
                        }
                      },
                      icon: null,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
