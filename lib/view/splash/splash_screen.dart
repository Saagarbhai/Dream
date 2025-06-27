import 'dart:developer';
import 'package:dreamvila/core/utils/app_export.dart';

class SplashScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const SplashScreen();
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.splashStatus == Status.success) {
            try {
              NavigatorService.pushAndRemoveUntil(AppRoutes.homeRoute);
            } catch (e) {
              log(e.toString());
            }
          } else if (state.splashStatus == Status.failure) {
            try {
              NavigatorService.pushAndRemoveUntil(AppRoutes.signinRoute);
            } catch (e) {
              log(e.toString());
            }
          }
        },
        builder: (context, state) {
          return Center(
            child: _splashscreen(),
          );
        },
      ),
    );
  }
}

Widget _splashscreen() {
  return AppImageView(
    imagePath: "assets/images/app_logo/Group 1000005948.png",
    height: 70.h,
    fit: BoxFit.fill,
  );
}
