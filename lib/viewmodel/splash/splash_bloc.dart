// import 'dart:developer';

import 'dart:developer';

import 'package:dreamvila/core/utils/app_export.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<LoadSplashEvent>(_loadSplashEvent);
  }
  Future<void> _loadSplashEvent(LoadSplashEvent event, Emitter emit) async {
    log('splash bloc called');
    await Future.delayed(Duration(seconds: 3));
    emit(state.copyWith(splashStatus: Status.failure));
  }
}
