import 'package:dreamvila/core/utils/app_export.dart';

extension AppLocalizationsX on BuildContext {
  Lang? get l10n => Lang.of(this);
}

final List<LocalizationsDelegate<dynamic>> localizationDelegates = [
  Lang.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
