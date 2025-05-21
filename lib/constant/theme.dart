import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(4),
        foregroundColor: WidgetStatePropertyAll(Colors.white,),
        shadowColor: WidgetStatePropertyAll(Colors.black26),
        backgroundColor: WidgetStatePropertyAll(MyColours.blue),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
        ),
      ),
    )

  );
}
