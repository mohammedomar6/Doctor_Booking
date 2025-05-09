import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData themeData = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: MyColours.blue,
          onPrimary: MyColours.white,

          secondary: MyColours.blue,
          onSecondary: MyColours.white,
          error: MyColours.red,
          onError: Colors.white,
          surface: MyColours.white,
          onSurface: MyColours.blue
      ),

  );
}
