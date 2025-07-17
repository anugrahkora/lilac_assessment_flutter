import 'package:go_router/go_router.dart';
import 'package:lilac_assessment_flutter/presentation/views/chats/chat_list.dart';
import 'package:lilac_assessment_flutter/presentation/views/chats/chat_view.dart';
import 'package:lilac_assessment_flutter/presentation/views/enter_otp/enter_otp.dart';
import 'package:lilac_assessment_flutter/presentation/views/enter_phone_number/enter_phone_number.dart';
import 'package:lilac_assessment_flutter/presentation/views/splash/splash_screen.dart';

// Router configuration for the application

class AppRoutes {
  static const String splash = '/splash';
  static const String enterPhoneNumber = '/enterPhoneNumber';
  static const String enterOtp = '/enterOtp';
  static const String chatList = '/chatList';
  static const String chatView = '/chatView';
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
        final phoneNumber = state.extra is String
            ? state.extra as String
            : null;
        return EnterOtp(phoneNumber: phoneNumber);
      },
    ),
     GoRoute(
      path: AppRoutes.chatList,
      builder: (context, state) {
         final response = state.extra is Map<String, dynamic>
            ? state.extra as Map<String, dynamic>
            : null;
     
        return ChatList(response: response,);}
    ),
     GoRoute(
      path: AppRoutes.chatView,
      builder: (context, state) {
         final response = state.extra is Map<String, dynamic>
            ? state.extra as Map<String, dynamic>
            : null;
     
        return ChatView();}
    ),
  ],
);
