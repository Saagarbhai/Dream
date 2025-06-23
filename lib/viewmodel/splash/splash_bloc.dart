// import 'dart:developer';

import 'dart:developer';

import 'package:dreamvila/core/utils/app_export.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<LoadSplashEvent>(_loadSplashEvent);
  }
  Future<void> _loadSplashEvent(LoadSplashEvent event, Emitter emit) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // emit(state.copyWith(splashStatus: Status.loading));
    // bool isLogin = prefs.getBool("isLogin") ?? false;
    await Future.delayed(Duration(seconds: 3));
    log('splash bloc called');
    emit(state.copyWith(splashStatus: Status.failure));
    // log(isLogin as String);
    // if (isLogin) {
    //   emit(state.copyWith(splashStatus: Status.success));
    // } else {
    //   emit(state.copyWith(splashStatus: Status.failure));
    // }
  }
}
