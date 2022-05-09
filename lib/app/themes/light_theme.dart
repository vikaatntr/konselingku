import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konselingku/app/constant/colors.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: Colors.white,

    // ignore: deprecated_member_use
    primaryColorBrightness: Brightness.light,
    brightness: Brightness.light,
    // scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme:
        const ColorScheme.light().copyWith(primary: AppColors.primaryColor),
    splashColor: (GetPlatform.isIOS)
        ? Colors.transparent
        : Theme.of(context).splashColor,
    highlightColor: (GetPlatform.isIOS)
        ? Colors.grey.shade50
        : Theme.of(context).highlightColor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: AppColors.black),
      titleTextStyle: const TextStyle(color: AppColors.black),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 1,
      shadowColor: Colors.grey.shade50,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme.copyWith(
            caption: GoogleFonts.poppins(wordSpacing: 0.4, letterSpacing: 0.18),
            bodyText1: GoogleFonts.poppins(
              wordSpacing: 0.4,
              letterSpacing: 0.18,
              color: AppColors.black,
            ),
            bodyText2: GoogleFonts.poppins(
              wordSpacing: 0.4,
              letterSpacing: 0.18,
              color: AppColors.black,
            ),
            button: GoogleFonts.poppins(fontSize: 18),
            subtitle1: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.black,
                wordSpacing: 0.4,
                letterSpacing: 0.18),
            subtitle2: GoogleFonts.poppins(
                fontSize: 15,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                wordSpacing: 0.4,
                letterSpacing: 0.18),
            overline: GoogleFonts.poppins(fontSize: 11, color: AppColors.grey),
          ),
    ),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      filled: true,
      fillColor: AppColors.inputBoxColor,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        textStyle: const TextTheme().button,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
