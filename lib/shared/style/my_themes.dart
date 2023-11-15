import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'package:todo_c8/shared/style/app_colors.dart';
import 'package:todo_c8/shared/style/text_style.dart';
class MyThemeData{

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor:AppColors.lightGreenColor,
    primaryColor: AppColors.lightColor,

    textTheme: TextTheme(
        bodySmall:AppStyles.Robto12(),

        bodyMedium:AppStyles.Poppiens18(),

      bodyLarge:AppStyles.Poppiens22(),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightColor,
      iconTheme: IconThemeData(
        color: Colors.white,size: 30),
      centerTitle: false),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type :BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.lightColor,
      unselectedItemColor: Colors.grey.shade500,
    ));
  static ThemeData darkTheme = ThemeData(scaffoldBackgroundColor: AppColors.lightGreenColor,
      primaryColor: AppColors.lightColor,

      textTheme: TextTheme(
        bodySmall:GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.white
        ),
        bodyMedium:GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.lightColor
        ),
        bodyLarge:GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightColor,
          iconTheme: IconThemeData(
              color: Colors.black,size: 30),
          centerTitle: false),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        type :BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.lightColor,
        unselectedItemColor: Colors.grey.shade500,
      ));

}