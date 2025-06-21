import 'package:dreamvila/core/utils/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ToastificationWrapper(
      child: const MyApp(),
    ),
  );
}
