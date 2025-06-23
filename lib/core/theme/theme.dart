import 'package:dreamvila/core/utils/app_export.dart';

class MyAppThemeHelper {
  static const Color primaryColor = Colors.orange;
  static const Color secondaryColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color greyColor = Colors.grey;

  static ThemeData get lightTheme {
    return ThemeData(
        colorScheme: ColorScheme.light(
            primary: Color(0XFFFF6F42),
            secondary: Colors.black,
            onPrimary: Colors.white),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Color(0XFFCECCD9)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Color(0XFF000000)),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Color(0XFFFF6F42)),
          fillColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateBorderSide.resolveWith((state) {
            return BorderSide(color: Color(0XFFCECCD9), width: 1);
          }),
        ));
  }
}

class CustomColors {
  final Color primaryColor;
  final Color secondaryColor;
  final Color borderColor;
  final Color greyColor;

  const CustomColors(
      {required this.primaryColor,
      required this.secondaryColor,
      required this.borderColor,
      required this.greyColor});

  static const light = CustomColors(
      primaryColor: Color(0XFFFF6F42),
      secondaryColor: Colors.white,
      borderColor: Color(0XFFCECCD9),
      greyColor: Colors.grey);

  static const dark = CustomColors(
      primaryColor: Color(0XFFFF6F42),
      secondaryColor: Colors.white,
      borderColor: Color(0XFFCECCD9),
      greyColor: Colors.grey);
}

extension ThemeDataCustomColors on ThemeData {
  CustomColors get customColors =>
      brightness == Brightness.dark ? CustomColors.dark : CustomColors.light;
}
