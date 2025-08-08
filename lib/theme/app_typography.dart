import 'package:flutter/material.dart';

/// Typography styles for the Pokédex application
class AppTypography {
  AppTypography._();

  static const String _fontFamily = 'Poppins';

  // Heading styles
  static const TextStyle h1 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  // Body text styles
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // Label styles
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  // Button styles
  static const TextStyle button = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  // Caption styles
  static const TextStyle caption = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: 1.5,
  );
}