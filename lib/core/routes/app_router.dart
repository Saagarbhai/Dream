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
      detailsRoute: (BuildContext context) {
        final arg = ModalRoute.of(context)!.settings.arguments;
        final id = (arg is String) ? arg : '';
        return DetailsScreen(id: id);
      },
      addUpdateRoute: (BuildContext context) {
        final args = ModalRoute.of(context)!.settings.arguments;
        final data = args is Map<String, dynamic> ? args : {};
        return AddUpdateScreen(
          isUpdate: data['isUpdate'] ?? false,
          property: data['data'],
        );
      },
    };
  }
}
