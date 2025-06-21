import 'package:dreamvila/core/utils/app_export.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppConstants.initialRoute: (context) => const SplashScreen(),
      AppConstants.homeRoute: (context) => const HomeScreen(),
      AppConstants.signinRoute: (context) => const SignInScreen(),
    };
  }
}
