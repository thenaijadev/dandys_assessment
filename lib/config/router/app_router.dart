import 'package:flutter/material.dart';
import 'package:minimalist_social_app/config/router/routes.dart';
import 'package:minimalist_social_app/core/widgets/error_screen.dart';
import 'package:minimalist_social_app/features/auth/presentation/screens/email_sent_screen.dart';
import 'package:minimalist_social_app/features/auth/presentation/screens/email_verification_screen.dart';
import 'package:minimalist_social_app/features/auth/presentation/screens/landing_screen.dart';
import 'package:minimalist_social_app/features/auth/presentation/screens/login_screen.dart';
import 'package:minimalist_social_app/features/home/presentation/pages/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // logger.i("This is the route: ${routeSettings.name}");
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.landing:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );

      case Routes.emailSent:
        return MaterialPageRoute(
          builder: (_) => const EmailSentScreen(),
        );
      case Routes.emailVerification:
        return MaterialPageRoute(
          builder: (_) => const EmailVerificationScreen(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
