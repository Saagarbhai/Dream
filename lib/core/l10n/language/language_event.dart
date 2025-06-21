import 'package:dreamvila/core/utils/app_export.dart';

abstract class LanguageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadLanguage extends LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String code;

  ChangeLanguage({required this.code});

  @override
  List<Object> get props => [code];
}
