import 'package:flutter/material.dart';
import 'package:nacey_flutter_tools/theme/colors.dart';

class RoyalColors {
  static ColorScheme royalPurpleLightScheme =
      ThemeData.light().colorScheme.copyWith(
            primary: royalPurple,
            onPrimary: Colors.white,
            primaryContainer: midnight200,
            onPrimaryContainer: Colors.black,
            secondary: maroon,
            onSecondary: Colors.white,
            secondaryContainer: royalPurpleA100,
            onSecondaryContainer: Colors.black,
            tertiary: midnight,
            onTertiary: Colors.white,
            tertiaryContainer: maroon200,
            onTertiaryContainer: Colors.black,
            error: stopSignRed,
            onError: Colors.white,
            errorContainer: materialYellow200,
            onErrorContainer: stopSignRed,
            background: maroon100,
            onBackground: Colors.black,
            surface: midnight100,
            onSurface: Colors.black,
            surfaceVariant: royalPurple100,
            onSurfaceVariant: Colors.black,
            outline: maroon,
          );
  static ColorScheme royalPurpleDarkScheme =
      ThemeData.dark().colorScheme.copyWith(
            primary: royalPurple,
            onPrimary: Colors.white,
            primaryContainer: midnight200,
            onPrimaryContainer: Colors.black,
            secondary: maroon,
            onSecondary: Colors.white,
            secondaryContainer: royalPurpleA100,
            onSecondaryContainer: Colors.black,
            tertiary: midnight,
            onTertiary: Colors.white,
            tertiaryContainer: maroon200,
            onTertiaryContainer: Colors.black,
            error: stopSignRed,
            onError: Colors.white,
            errorContainer: materialYellow200,
            onErrorContainer: stopSignRed,
            background: maroon100,
            onBackground: Colors.black,
            surface: midnight100,
            onSurface: Colors.black,
            surfaceVariant: royalPurple100,
            onSurfaceVariant: Colors.black,
            outline: maroon,
          );

  static MaterialColor royalSwatch =
      MaterialColor(royalPurple.value, _royalMap);
  static const Map<int, Color> _royalMap = {
    50: royalPurple050,
    100: royalPurple100,
    200: royalPurple200,
    300: royalPurple300,
    400: royalPurple400,
    500: royalPurple500,
    600: royalPurple600,
    700: royalPurple700,
    800: royalPurple800,
    900: royalPurple900,
    1: royalPurpleA100,
    2: royalPurpleA200,
    4: royalPurpleA400,
    7: royalPurpleA700,
  };
  static const Color royalPurple = royalPurple500;
  static const Color royalAccent = royalPurpleA200;
  static const Color royalPurple050 = Color(0xFFE9E0EE);
  static const Color royalPurple100 = Color(0xFFC9B3D4);
  static const Color royalPurple200 = Color(0xFFA580B7);
  static const Color royalPurple300 = Color(0xFF814D9A);
  static const Color royalPurple400 = Color(0xFF662684);
  static const Color royalPurple500 = Color(0xFF4B006E);
  static const Color royalPurple600 = Color(0xFF440066);
  static const Color royalPurple700 = Color(0xFF3B005B);
  static const Color royalPurple800 = Color(0xFF330051);
  static const Color royalPurple900 = Color(0xFF23003F);
  static const Color royalPurpleA100 = Color(0xFFB574FF);
  static const Color royalPurpleA200 = Color(0xFF9A41FF);
  static const Color royalPurpleA400 = Color(0xFF7F0EFF);
  static const Color royalPurpleA700 = Color(0xFF7200F4);

  static MaterialColor maroonSwatch = MaterialColor(maroon.value, _maroonMap);
  static const Map<int, Color> _maroonMap = {
    50: maroon050,
    100: maroon100,
    200: maroon200,
    300: maroon300,
    400: maroon400,
    500: maroon500,
    600: maroon600,
    700: maroon700,
    800: maroon800,
    900: maroon900,
    1: maroonA100,
    2: maroonA200,
    4: maroonA400,
    7: maroonA700,
  };
  static const Color maroon = maroon500;
  static const Color maroonAccent = maroonA200;
  static const Color maroon050 = Color(0xFFEEE0EB);
  static const Color maroon100 = Color(0xFFD4B3CE);
  static const Color maroon200 = Color(0xFFB780AD);
  static const Color maroon300 = Color(0xFF9A4D8C);
  static const Color maroon400 = Color(0xFF842673);
  static const Color maroon500 = Color(0xFF6E005A);
  static const Color maroon600 = Color(0xFF660052);
  static const Color maroon700 = Color(0xFF5B0048);
  static const Color maroon800 = Color(0xFF51003F);
  static const Color maroon900 = Color(0xFF3F002E);
  static const Color maroonA100 = Color(0xFFFF74D0);
  static const Color maroonA200 = Color(0xFFFF41BE);
  static const Color maroonA400 = Color(0xFFFF0EAD);
  static const Color maroonA700 = Color(0xFFF400A1);

  static MaterialColor midnightSwatch =
      MaterialColor(midnight.value, _midnightMap);
  static const Map<int, Color> _midnightMap = {
    50: midnight050,
    100: midnight100,
    200: midnight200,
    300: midnight300,
    400: midnight400,
    500: midnight500,
    600: midnight600,
    700: midnight700,
    800: midnight800,
    900: midnight900,
    1: midnightA100,
    2: midnightA200,
    4: midnightA400,
    7: midnightA700,
  };
  static const Color midnight = midnight500;
  static const Color midnightAccent = midnightA200;
  static const Color midnight050 = Color(0xFFE3E0EE);
  static const Color midnight100 = Color(0xFFB9B3D4);
  static const Color midnight200 = Color(0xFF8A80B7);
  static const Color midnight300 = Color(0xFF5B4D9A);
  static const Color midnight400 = Color(0xFF372684);
  static const Color midnight500 = Color(0xFF14006E);
  static const Color midnight600 = Color(0xFF120066);
  static const Color midnight700 = Color(0xFF0E005B);
  static const Color midnight800 = Color(0xFF0B0051);
  static const Color midnight900 = Color(0xFF06003F);
  static const Color midnightA100 = Color(0xFF7874FF);
  static const Color midnightA200 = Color(0xFF4641FF);
  static const Color midnightA400 = Color(0xFF140EFF);
  static const Color midnightA700 = Color(0xFF0600F4);

  static MaterialColor matYellowSwatch =
      MaterialColor(materialYellow.value, _matYellowMap);
  static const Map<int, Color> _matYellowMap = {
    50: materialYellow050,
    100: materialYellow100,
    200: materialYellow200,
    300: materialYellow300,
    400: materialYellow400,
    500: materialYellow500,
    600: materialYellow600,
    700: materialYellow700,
    800: materialYellow800,
    900: materialYellow900,
    1: materialYellowA100,
    2: materialYellowA200,
    4: materialYellowA400,
    7: materialYellowA700,
  };
  static const Color materialYellow = materialYellow500;
  static const Color materialYellowAccent = materialYellowA200;
  static const Color materialYellow050 = Color(0xFFFFFDE7);
  static const Color materialYellow100 = Color(0xFFFFF9C4);
  static const Color materialYellow200 = Color(0xFFFFF59D);
  static const Color materialYellow300 = Color(0xFFFFF176);
  static const Color materialYellow400 = Color(0xFFFFEE58);
  static const Color materialYellow500 = Color(0xFFFFEB3B);
  static const Color materialYellow600 = Color(0xFFFFE935);
  static const Color materialYellow700 = Color(0xFFFFE52D);
  static const Color materialYellow800 = Color(0xFFFFE226);
  static const Color materialYellow900 = Color(0xFFFFDD19);
  static const Color materialYellowA100 = Color(0xFFFFFFFF);
  static const Color materialYellowA200 = Color(0xFFFFFFFD);
  static const Color materialYellowA400 = Color(0xFFFFF7CA);
  static const Color materialYellowA700 = Color(0xFFFFF2B1);
}
