import 'package:flutter/material.dart';

class Palette {
  // https://maketintsandshades.com/
  static const MaterialColor darkPrimarySwatch = MaterialColor(
    0xFF4A9CF8, // 0%
    <int, Color>{
      50: Color(0xff5ca6f9), //10%
      100: Color(0xff6eb0f9), //20%
      200: Color(0xff80bafa), //30%
      300: Color(0xff92c4fb), //40%
      400: Color(0xffa5cefc), //50%
      500: Color(0xffb7d7fc), //60%
      600: Color(0xffc9e1fd), //70%
      700: Color(0xffdbebfe), //80%
      800: Color(0xffedf5fe), //90%
      900: Color(0xffffffff), //100%
    },
  );

  static const Color darkBackground = Color(0xFF1D243E);
}
