import 'package:go_router/go_router.dart';
import 'package:lilac_assessment_flutter/presentation/views/enter_otp/enter_otp.dart';
import 'package:lilac_assessment_flutter/presentation/views/enter_phone_number/enter_phone_number.dart';
import 'package:lilac_assessment_flutter/presentation/views/splash/splash_screen.dart';


// Router configuration for the application


class AppRoutes {
  static const String splash = '/splash';
  static const String enterPhoneNumber = '/enterPhoneNumber';
  static const String enterOtp = '/enterOtp';
  
}

final appRouter = GoRouter(

  initialLocation: AppRoutes.splash,
  routes: [
  
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => SplashScreen(),
    ),
   GoRoute(
      path: AppRoutes.enterPhoneNumber,
      builder: (context, state) => EnterPhoneNumber(),
    ),
       GoRoute(
      path: AppRoutes.enterOtp,
      builder: (context, state) {
        final phoneNumber = state.extra is String? state.extra as String: null;
        return EnterOtp(
          phoneNumber: phoneNumber,
        );}
    ),

  ],
);