import 'package:flutter/material.dart';

/// Application color constants based on the Pokédex design system
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF3558CD);
  static const Color primaryLight = Color(0xFF6C91F2);
  static const Color primaryDark = Color(0xFF1D2C5E);

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF7F7F7);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF1D1D1D);
  static const Color textSecondary = Color(0xFF747476);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Pokemon Type Colors
  static const Color grassType = Color(0xFF62B957);
  static const Color fireType = Color(0xFFFFA756);
  static const Color waterType = Color(0xFF58ABF6);
  static const Color electricType = Color(0xFFFFD86F);
  static const Color psychicType = Color(0xFFFA7179);
  static const Color iceType = Color(0xFF91D5FF);
  static const Color dragonType = Color(0xFF0F6AC0);
  static const Color darkType = Color(0xFF58575F);
  static const Color fightingType = Color(0xFF973A29);
  static const Color poisonType = Color(0xFF9F5BBA);
  static const Color groundType = Color(0xFFAD7235);
  static const Color flyingType = Color(0xFF748FC9);
  static const Color bugType = Color(0xFF9DC130);
  static const Color rockType = Color(0xFFB1736C);
  static const Color ghostType = Color(0xFF5269AC);
  static const Color steelType = Color(0xFF5695A3);
  static const Color fairyType = Color(0xFFED8FE6);
  static const Color normalType = Color(0xFF9DA0AA);

  // Card States
  static const Color cardShadow = Color(0x1A000000);
  static const Color cardBorder = Color(0xFFE0E0E0);

  // System Colors
  static const Color success = Color(0xFF62B957);
  static const Color warning = Color(0xFFFFD86F);
  static const Color error = Color(0xFFFA7179);
  static const Color info = Color(0xFF58ABF6);

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
      case 'fairy':
        return fairyType;
      case 'normal':
      default:
        return normalType;
    }
  }
}