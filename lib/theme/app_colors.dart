import 'package:flutter/material.dart';

/// AppColors class containing all color definitions for the Pokédex app
/// Based on the Style Guide from the Figma design specifications
class AppColors {
  AppColors._();

  // Primary colors
  static const Color primary = Color(0xFF3B4CCA);
  static const Color primaryDark = Color(0xFF2A3B9F);
  static const Color primaryLight = Color(0xFF5A6BDB);
  
  // Secondary colors
  static const Color secondary = Color(0xFFFFCB05);
  static const Color secondaryDark = Color(0xFFE6B800);
  static const Color secondaryLight = Color(0xFFFFD93D);
  
  // Background colors
  static const Color background = Color(0xFFF7F7F7);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  
  // Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textHint = Color(0xFFBDBDBD);
  
  // Pokemon type colors
  static const Color typeNormal = Color(0xFFA8A878);
  static const Color typeFire = Color(0xFFF08030);
  static const Color typeWater = Color(0xFF6890F0);
  static const Color typeElectric = Color(0xFFF8D030);
  static const Color typeGrass = Color(0xFF78C850);
  static const Color typeIce = Color(0xFF98D8D8);
  static const Color typeFighting = Color(0xFFC03028);
  static const Color typePoison = Color(0xFFA040A0);
  static const Color typeGround = Color(0xFFE0C068);
  static const Color typeFlying = Color(0xFFA890F0);
  static const Color typePsychic = Color(0xFFF85888);
  static const Color typeBug = Color(0xFFA8B820);
  static const Color typeRock = Color(0xFFB8A038);
  static const Color typeGhost = Color(0xFF705898);
  static const Color typeDragon = Color(0xFF7038F8);
  static const Color typeDark = Color(0xFF705848);
  static const Color typeSteel = Color(0xFFB8B8D0);
  static const Color typeFairy = Color(0xFFEE99AC);
  
  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  // Card colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardShadow = Color(0x1A000000);
  static const Color cardBorder = Color(0xFFE0E0E0);
  
  // Gradient colors for Pokemon cards
  static const List<Color> fireGradient = [
    Color(0xFFFF6B6B),
    Color(0xFFFF8E53),
  ];
  
  static const List<Color> waterGradient = [
    Color(0xFF74B9FF),
    Color(0xFF0984E3),
  ];
  
  static const List<Color> grassGradient = [
    Color(0xFF00B894),
    Color(0xFF00A085),
  ];
  
  static const List<Color> electricGradient = [
    Color(0xFFFDCB6E),
    Color(0xFFE17055),
  ];
  
  static const List<Color> defaultGradient = [
    Color(0xFFDDD6FE),
    Color(0xFFA78BFA),
  ];

  /// Get Pokemon type color by type name
  static Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'normal':
        return typeNormal;
      case 'fire':
        return typeFire;
      case 'water':
        return typeWater;
      case 'electric':
        return typeElectric;
      case 'grass':
        return typeGrass;
      case 'ice':
        return typeIce;
      case 'fighting':
        return typeFighting;
      case 'poison':
        return typePoison;
      case 'ground':
        return typeGround;
      case 'flying':
        return typeFlying;
      case 'psychic':
        return typePsychic;
      case 'bug':
        return typeBug;
      case 'rock':
        return typeRock;
      case 'ghost':
        return typeGhost;
      case 'dragon':
        return typeDragon;
      case 'dark':
        return typeDark;
      case 'steel':
        return typeSteel;
      case 'fairy':
        return typeFairy;
      default:
        return typeNormal;
    }
  }

  /// Get gradient colors for Pokemon type
  static List<Color> getTypeGradient(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return fireGradient;
      case 'water':
        return waterGradient;
      case 'grass':
        return grassGradient;
      case 'electric':
        return electricGradient;
      default:
        return defaultGradient;
    }
  }
}