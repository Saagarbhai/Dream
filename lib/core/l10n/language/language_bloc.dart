import 'package:dreamvila/core/utils/app_export.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState()) {
    on<LoadLanguage>(_loadLanguage);
    on<ChangeLanguage>(_changeLanguage);
  }
  Future<void> _loadLanguage(LoadLanguage event, Emitter emit) async {
    try {
      emit(state.copyWith(languageStatus: Status.loading));

      final prefs = await SharedPreferences.getInstance();
      final languageCode = prefs.getString('languageCode') ?? 'en';

      emit(state.copyWith(
          languageStatus: Status.success, locale: Locale(languageCode)));
    } catch (e) {
      emit(state.copyWith(
          languageStatus: Status.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _changeLanguage(ChangeLanguage event, Emitter emit) async {
    try {
      emit(state.copyWith(languageStatus: Status.loading));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('languageCode', event.code);

      emit(state.copyWith(
          languageStatus: Status.success, locale: Locale(event.code)));
    } catch (e) {
      emit(state.copyWith(
          languageStatus: Status.failure, errorMessage: e.toString()));
    }
  }
}
