import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xff1C1C1E),
    primaryColor: Color.fromRGBO(181, 28, 128, 1),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 36,
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontSize: 36,
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          color: Colors.white,
        )),
  );
}
