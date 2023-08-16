import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xff1C1C1E),
    primaryColor: const Color(0xffB51C80),
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
        bodyMedium: TextStyle(
          fontSize: 16,
          fontFamily: 'Roboto',
          color: Colors.white,
        )),
  );
}
