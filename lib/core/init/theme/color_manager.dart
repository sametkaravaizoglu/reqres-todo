import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instace = ColorManager._init();
  static ColorManager get instance {
    return _instace;
  }

  ColorManager._init();

  Color get white => const Color(0xffffffff);
  Color get gray => const Color(0xffa5a6ae);
  Color get darkGray => const Color(0xff383838);
  Color get black => const Color(0xff020306);
  Color get transparent => const Color(0x00000000);

  MaterialColor get materialBlack => const MaterialColor(
        0xff000000,
        <int, Color>{
          50: Colors.black,
          100: Colors.black,
          200: Colors.black,
          300: Colors.black,
          400: Colors.black,
          500: Colors.black,
          600: Colors.black,
          700: Colors.black,
          800: Colors.black,
          900: Colors.black,
        },
      );
}
