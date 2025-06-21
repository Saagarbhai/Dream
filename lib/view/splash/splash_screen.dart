import 'dart:developer';

import 'package:dreamvila/core/utils/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.splashStatus == Status.success) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppConstants.homeRoute,
              (Route<dynamic> route) => false,
            );
          } else if (state.splashStatus == Status.failure) {
            try {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppConstants.signinRoute,
                (route) => false,
              );
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
  return AppImageView(imagePath: "assets/images/app_logo/app_logo.svg");
}
