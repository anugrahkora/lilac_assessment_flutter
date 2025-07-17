import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_assessment_flutter/core/constants/app_colors/app_colors.dart';
import 'package:lilac_assessment_flutter/core/constants/app_strings/app_strings.dart';
import 'package:lilac_assessment_flutter/core/route/app_routes.dart';
import 'package:lilac_assessment_flutter/core/themes/app_themes.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_bloc.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_event.dart';
import 'package:lilac_assessment_flutter/presentation/bloc/phone_number_bloc/phone_number_state.dart';
import 'package:lilac_assessment_flutter/presentation/widgets/back_button.dart';
import 'package:lilac_assessment_flutter/presentation/widgets/gradient_cta.dart';
import 'package:lilac_assessment_flutter/presentation/widgets/otp_field.dart';

class EnterOtp extends StatefulWidget {
  final String? phoneNumber;
  const EnterOtp({super.key, required this.phoneNumber});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  String? _otp;
  late PhoneNumberBloc _phoneNumberBloc;
  bool _isOtpVerifying=false;
  @override
  void initState() {
    _phoneNumberBloc = BlocProvider.of<PhoneNumberBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: BlocConsumer<PhoneNumberBloc, PhoneNumberState>(
          listener: (context, state) {
            if(state is OtpVerfificationState){
              _isOtpVerifying=true;
            }
            else if(state is OtpVerificationSuccessState){
              _isOtpVerifying=false;
              context.push(AppRoutes.chatList, extra: state.response);
            }
            else if(state is OtpErrorState){
              _isOtpVerifying=false;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
            else if(state is OtpStopVerificationState){
              _isOtpVerifying=false;
            }},
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
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
                          AppStrings.enterVerificationCode,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jost(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.button1.copyWith(
                          color: AppTextColors.mediumGrey,
                        ),
                        children: [
                          TextSpan(text: widget.phoneNumber ?? ''),
                          const TextSpan(text: '.  '),
                          TextSpan(
                            text: AppStrings.edit,
                            style: AppTextStyles.body1.copyWith(
                              color: AppTextColors.darkGrey,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    OtpField(onCompleted: (otp) {
                      _otp = otp;
                      
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        AppStrings.didntReceiveCode,
                        style: AppTextStyles.body1.copyWith(
                          color: AppTextColors.mediumGrey,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppStrings.resend,
                        style: AppTextStyles.body1.copyWith(
                          color: AppTextColors.lightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GradientCTA(
                      isLoading: _isOtpVerifying,
                      label: AppStrings.verify,
                      onPressed: () {
                        if(_otp != null && _otp!.isNotEmpty) {
                          _phoneNumberBloc.add(
                            VerifyOtpEvent(
                              otpCode: _otp!,
                              phoneNumber: widget.phoneNumber ?? '',
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
