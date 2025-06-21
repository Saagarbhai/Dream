import 'package:dreamvila/core/utils/app_export.dart';

class MyAppThemeHelper {
  static const Color primary = Colors.deepPurpleAccent;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color amber = Colors.amber;

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: primary,
        secondary: primary.withOpacity(0.2),
        onPrimary: white,
        onSecondary: white,
        surface: white,
        onSurface: black,
      ),
      brightness: Brightness.light,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
          titleLarge: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: primary,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 15.sp,
            fontFamily: 'Poppins',
            color: black,
          ),
          bodySmall: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              color: Colors.grey[600],
              fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontSize: 12.sp, color: black))),
      appBarTheme: AppBarTheme(
        color: primary,
        titleTextStyle: GoogleFonts.poppins(
            fontSize: 20.sp, fontWeight: FontWeight.bold, color: white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: white,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        color: white,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: primary,
        labelStyle: TextStyle(
          fontFamily: 'Poppins',
          color: white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  // static ThemeData get darkTheme {
  //   return ThemeData(
  //     colorScheme: ColorScheme.dark(
  //       primary: primary,
  //       secondary: secondaryColor,
  //       onPrimary: whiteColor,
  //       onSecondary: black,
  //       surface: Color(0xFF1E1E1E),
  //       onSurface: whiteColor,
  //     ),
  //     brightness: Brightness.dark,
  //     splashColor: transparent,
  //     highlightColor: transparent,
  //     textTheme: GoogleFonts.ubuntuTextTheme().apply(
  //       bodyColor: whiteColor,
  //       displayColor: whiteColor,
  //     ),
  //     appBarTheme: AppBarTheme(
  //       color: primary,
  //       titleTextStyle: GoogleFonts.ubuntu(
  //         fontSize: 20,
  //         fontWeight: FontWeight.bold,
  //         color: whiteColor,
  //       ),
  //     ),
  //     inputDecorationTheme: InputDecorationTheme(
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //         borderSide: BorderSide(color: primary, width: 1),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //         borderSide: BorderSide(color: primary, width: 1),
  //       ),
  //       errorMaxLines: 2,
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //         borderSide: BorderSide(color: primary, width: 2),
  //       ),
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         disabledBackgroundColor: primary.withOpacity(0.5),
  //         backgroundColor: primary,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16.0),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

// class CustomColors {
//   final Color primary;
//   final Color borderColor;
//   final Color socialContainer;
//   final Color socialButton;
//   final Color white;
//   final Color black;
//   final Color dividerColor;
//   final Color uploadPostSocialBTN;
//   final Color tabcolor;
//   final Color fillcolor;
//   final Color greylite;
//   final Color greyContainerBg;
//   final Color transparent;
//   final Color subtitlecolor;
//   final Color subHeadingcolor;
//   final Color authsubtitlecolor;
//   final Color messagecolor;
//   final Color otpBorderColor;
//   final Color selectImageBgColor;
//   final Color bottomsheetHendalColor;
//   final Color settingCardShadowColor;
//   final Color settingCardIconBGColor;
//   final Color logoutTextColor;
//   final Color blueColor;
//   final Color greydivider;
//   final Color disableButtonColor;
//   final Color greenColor;

//   // final Color shimmerColor;

//   const CustomColors({
//     required this.primary,
//     required this.borderColor,
//     required this.socialContainer,
//     required this.socialButton,
//     required this.white,
//     required this.black,
//     required this.dividerColor,
//     required this.uploadPostSocialBTN,
//     required this.tabcolor,
//     required this.fillcolor,
//     required this.greylite,
//     required this.greyContainerBg,
//     required this.transparent,
//     required this.subtitlecolor,
//     required this.subHeadingcolor,
//     required this.authsubtitlecolor,
//     required this.messagecolor,
//     required this.otpBorderColor,
//     required this.selectImageBgColor,
//     required this.bottomsheetHendalColor,
//     required this.settingCardShadowColor,
//     required this.settingCardIconBGColor,
//     required this.logoutTextColor,
//     required this.blueColor,
//     required this.greydivider,
//     required this.disableButtonColor,
//     required this.greenColor,
//     // required this.shimmerColor,
//   });

//   static const light = CustomColors(
//     primary: deepOrangeAccent,
//     borderColor: Color(0xff563D39),
//     socialContainer: Color(0xffEFEBE9),
//     socialButton: white,
//     white: white,
//     black: black,
//     dividerColor: Color(0xff555555),
//     otpBorderColor: Color(0xffE0E0E0),
//     uploadPostSocialBTN: Color(0xffF5F5F5),
//     tabcolor: Color(0xffDFDCDB),
//     fillcolor: Color(0xffEFEFF0),
//     greylite: Color(0xff929290),
//     greyContainerBg: Color(0xffF4F4F4),
//     subtitlecolor: Color(0xff292D32),
//     authsubtitlecolor: Color(0xffAA8882),
//     subHeadingcolor: Color(0xff74655E),
//     messagecolor: Color(0XFFF1EFEF),
//     selectImageBgColor: Color(0XFFF8F8F8),
//     transparent: transparent,
//     bottomsheetHendalColor: Color(0XFFD9D9D9),
//     settingCardShadowColor: Color(0XFF063336),
//     settingCardIconBGColor: Color(0XFFB9C1D1),
//     logoutTextColor: Color(0XFFEC2A38),
//     blueColor: blue,
//     greydivider: Color(0xffF0F0F0),
//     disableButtonColor: Color(0xffDAD6D6),
//     greenColor: Color(0xff00AE0C),
//   );

//   static const dark = CustomColors(
//     primary: Color(0xFF1E1E1E),
//     borderColor: Color(0xff563D39),
//     socialContainer: Color.fromARGB(77, 239, 235, 233),
//     socialButton: white38,
//     white: white38,
//     black: white,
//     dividerColor: Color(0xff555555),
//     otpBorderColor: Color(0xffE0E0E0),
//     uploadPostSocialBTN: Color(0xffF5F5F5),
//     tabcolor: Color(0xffDFDCDB),
//     fillcolor: Color(0xffEFEFF0),
//     greylite: Color(0xff929290),
//     transparent: transparent,
//     greyContainerBg: Color(0xffF4F4F4),
//     subtitlecolor: Color(0xff292D32),
//     authsubtitlecolor: Color(0xffAA8882),
//     subHeadingcolor: Color(0xff74655E),
//     selectImageBgColor: Color(0XFFF8F8F8),
//     messagecolor: Color(0XFFF1EFEF),
//     bottomsheetHendalColor: Color(0XFFD9D9D9),
//     settingCardShadowColor: Color(0XFF063336),
//     settingCardIconBGColor: Color(0XFFB9C1D1),
//     logoutTextColor: Color(0XFFEC2A38),
//     blueColor: blue,
//     greydivider: Color(0xffF0F0F0),
//     disableButtonColor: Color(0xffDAD6D6),
//     greenColor: Color(0xff00AE0C),
//   );
// }

// extension ThemeDataCustomColors on ThemeData {
//   CustomColors get customColors =>
//       brightness == Brightness.dark ? Customdark : Customlight;
// }
