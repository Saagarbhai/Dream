import 'package:dreamvila/core/utils/app_export.dart';

class LanguageState extends Equatable {
  final Locale? locale;
  final String errorMessage;
  final Status languageStatus;

  const LanguageState(
      {this.locale, this.errorMessage = '', this.languageStatus = Status.init});

  LanguageState copyWith(
      {Locale? locale, String? errorMessage, Status? languageStatus}) {
    return LanguageState(
        locale: locale ?? this.locale,
        errorMessage: errorMessage ?? this.errorMessage,
        languageStatus: languageStatus ?? this.languageStatus);
  }

  @override
  List<Object?> get props => [locale, errorMessage, languageStatus];
}
