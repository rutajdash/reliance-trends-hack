import 'package:flutter/material.dart';

const Map<int, Color> lightSwatch = <int, Color>{
  50: Color(0xFFE2BCCA),
  100: Color(0xFFDB8DA9),
  200: Color(0xFFDA7E9F), // Accent
  300: Color(0xFFD1658D),
  400: Color(0xFFE63777), // Primary Light
  500: Color(0xFFB9265C),
  600: Color(0xFF900036), // Primary
  700: Color(0xFF7E002E),
  800: Color(0xFF47001A), // Primary Dark
  900: Color(0xFF29000F),
};

final ColorScheme lightColorScheme = ColorScheme.fromSwatch(
  primarySwatch: MaterialColor(lightSwatch[600]!.value, lightSwatch),
  primaryColorDark: lightSwatch[800],
  accentColor: lightSwatch[200],
  backgroundColor: Colors.white,
  brightness: Brightness.light,
  cardColor: Colors.white70,
  errorColor: Colors.red,
);

final ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  brightness: Brightness.light,
  primarySwatch: MaterialColor(lightSwatch[600]!.value, lightSwatch),
  primaryColor: lightSwatch[600],
  primaryColorLight: lightSwatch[400],
  primaryColorDark: lightSwatch[800],
  focusColor: lightSwatch[400],
  hoverColor: lightSwatch[500],
);
