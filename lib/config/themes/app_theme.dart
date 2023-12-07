import 'package:flutter/material.dart';
import 'package:quotes/config/themes/app_colors.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 20
      )
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Script'
      ),

      bodyMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          fontFamily: 'Times',
          color: Colors.black54

      ),
      bodySmall: TextStyle(
        color: Colors.white,
          fontSize: 15,
        fontWeight: FontWeight.bold,
          fontFamily: 'Times'
      ),
    )

  );
}