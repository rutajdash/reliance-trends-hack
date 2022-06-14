import 'package:flutter/material.dart';

final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF900036), brightness: Brightness.dark);

final ThemeData darkThemeData =
    ThemeData.from(colorScheme: darkColorScheme, useMaterial3: true);
