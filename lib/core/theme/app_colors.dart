import 'package:flutter/material.dart';

/// App color constants based on the Figma design system
class AppColors {
  AppColors._();

  // Primary colors
  static const Color primary = Color(0xFF3558CD);
  static const Color primaryVariant = Color(0xFF2A47B8);
  
  // Background colors
  static const Color background = Color(0xFFF7F7F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  
  // Text colors
  static const Color textPrimary = Color(0xFF1D1D1D);
  static const Color textSecondary = Color(0xFF747476);
  static const Color textTertiary = Color(0xFFAAAAAA);
  
  // Pokemon type colors
  static const Color grassType = Color(0xFF62B957);
  static const Color fireType = Color(0xFFFFA756);
  static const Color waterType = Color(0xFF58ABF6);
  static const Color electricType = Color(0xFFEDD53F);
  static const Color psychicType = Color(0xFFC85DE8);
  static const Color iceType = Color(0xFF8CCEC6);
  static const Color dragonType = Color(0xFF0F6AC0);
  static const Color darkType = Color(0xFF595761);
  static const Color fightingType = Color(0xFFD04164);
  static const Color poisonType = Color(0xFFB567CE);
  static const Color groundType = Color(0xFFDD7748);
  static const Color flyingType = Color(0xFF748FC9);
  static const Color bugType = Color(0xFF8CB230);
  static const Color rockType = Color(0xFFBAAB82);
  static const Color ghostType = Color(0xFF556AAE);
  static const Color steelType = Color(0xFF417D9A);
  static const Color normalType = Color(0xFF9DA0AA);
  
  // Additional colors
  static const Color shadow = Color(0x1A000000);
  static const Color divider = Color(0xFFE0E0E0);
  static const Color error = Color(0xFFE74C3C);
  static const Color success = Color(0xFF2ECC71);
  
  /// Get Pokemon type color by type name
  static Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return grassType;
      case 'fire':
        return fireType;
      case 'water':
        return waterType;
      case 'electric':
        return electricType;
      case 'psychic':
        return psychicType;
      case 'ice':
        return iceType;
      case 'dragon':
        return dragonType;
      case 'dark':
        return darkType;
      case 'fighting':
        return fightingType;
      case 'poison':
        return poisonType;
      case 'ground':
        return groundType;
      case 'flying':
        return flyingType;
      case 'bug':
        return bugType;
      case 'rock':
        return rockType;
      case 'ghost':
        return ghostType;
      case 'steel':
        return steelType;
      case 'normal':
        return normalType;
      default:
        return normalType;
    }
  }
}