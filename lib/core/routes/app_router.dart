import 'package:dreamvila/core/utils/app_export.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String homeRoute = '/home';
  static const String signinRoute = '/signin';
  static const String signupRoute = '/signup';
  static const String detailsRoute = '/details';
  static const String addUpdateRoute = "/addUpadte";

  static Map<String, WidgetBuilder> get routes {
    return {
      initialRoute: SplashScreen.builder,
      homeRoute: HomeScreen.builder,
      signinRoute: SignInScreen.builder,
      signupRoute: SignUpScreen.builder,
      detailsRoute: DetailsScreen.builder,
      addUpdateRoute: AddUpdateScreen.builder
    };
  }
}
