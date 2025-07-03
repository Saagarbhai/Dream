import 'package:dreamvila/core/utils/app_export.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  SplashBloc() : super(SplashState()) {
    on<LoadSplashEvent>(_loadSplashEvent);
  }
  Future<void> _loadSplashEvent(LoadSplashEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(splashStatus: Status.loading));
      bool result = await sharedPreferencesService.getUserIsLogin();
      await Future.delayed(Duration(seconds: 3));
      if (result) {
        emit(state.copyWith(splashStatus: Status.success));
      } else {
        emit(state.copyWith(splashStatus: Status.failure));
      }
    } catch (e) {
      Logger.error("Error From LoadSplashEvent : $e");
    }
  }
}
