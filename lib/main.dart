import 'package:dreamvila/core/utils/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DefaultCacheManager().emptyCache();
  runApp(
    ToastificationWrapper(
      child: const MyApp(),
    ),
  );
}
