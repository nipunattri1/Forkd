import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForkdTheme {
  const ForkdTheme._();

  static TextTheme get textTheme {
    return TextTheme(
      displayMedium: GoogleFonts.kronaOne(),
      headlineMedium: GoogleFonts.sora(),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple,
      ),
      textTheme: textTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple,
        brightness: Brightness.dark,
      ),
      textTheme: textTheme,
    );
  }
}
