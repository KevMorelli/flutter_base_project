import 'package:flutter/material.dart';
import 'package:flutter_base_project/ui/themes/palette.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Palette.darkPrimarySwatch,
  scaffoldBackgroundColor: Palette.darkBackground,
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: Colors.white,
    ),
    headline4: TextStyle(
      color: Colors.white,
    ),
  ),
);
