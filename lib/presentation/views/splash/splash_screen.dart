import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_assessment_flutter/core/constants/app_colors/app_colors.dart';
import 'package:lilac_assessment_flutter/core/constants/app_strings/app_strings.dart';
import 'package:lilac_assessment_flutter/core/constants/assets/app_assets.dart';
import 'package:lilac_assessment_flutter/core/route/app_routes.dart';
import 'package:lilac_assessment_flutter/core/themes/app_themes.dart';
import 'package:lilac_assessment_flutter/presentation/widgets/primary_cta.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.splash),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                SvgPicture.asset(AppIcons.logo, width: 50, height: 50),
                const SizedBox(height: 8),
                Text(
                  AppStrings.splashTitle,
                  textAlign: TextAlign.center,

                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 31.65,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                PrimaryCTA(
                  icon: _buildCTAIcon(AppIcons.googleIcon),

                  label: AppStrings.signInWithGoogle,
                  onPressed: () {},
                ),

                PrimaryCTA(
                  icon: _buildCTAIcon(AppIcons.facebook),
                  color: AppColors.facebookBlue,
                  label: AppStrings.signInWithFaceBook,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                PrimaryCTA(
                  icon: _buildCTAIcon(AppIcons.phoneCallIcon),
                  color: AppColors.primaryColor,
                  label: AppStrings.signInWithPhone,
                  textColor: Colors.white,
                  onPressed: () {
                             context.push(AppRoutes.enterPhoneNumber,);
                  },
                ),
                const SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.button1.copyWith(color: Colors.white),
                    children: [
                      const TextSpan(text: AppStrings.bySigningUp),
                      _buildTapableTextSpan(AppStrings.terms, () {}),
                      const TextSpan(text: AppStrings.seeHowWeUseYourData),
                      _buildTapableTextSpan(AppStrings.privacyPolicy, () {}),

                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextSpan _buildTapableTextSpan(String text, void Function()? onTap) {
    return TextSpan(
      text: text,
      style: AppTextStyles.button1.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()..onTap = onTap,
    );
  }

  SvgPicture _buildCTAIcon(String asset) {
    return SvgPicture.asset(asset, width: 50, height: 50);
  }
}
