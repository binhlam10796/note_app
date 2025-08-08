import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppElevations {
  AppElevations._();

  // Elevation Levels
  static const double level0 = 0.0;
  static const double level1 = 1.0;
  static const double level2 = 2.0;
  static const double level3 = 4.0;
  static const double level4 = 6.0;
  static const double level5 = 8.0;
  static const double level6 = 12.0;
  static const double level7 = 16.0;
  static const double level8 = 24.0;

  // Box Shadow Definitions
  static const List<BoxShadow> none = [];

  static const List<BoxShadow> small = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> large = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> extraLarge = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 8),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  // Pokemon Card Specific Shadows
  static const List<BoxShadow> pokemonCard = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x0D000000),
      offset: Offset(0, 1),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> pokemonCardHovered = [
    BoxShadow(
      color: AppColors.shadowDark,
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ];

  // Button Shadows
  static const List<BoxShadow> button = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> buttonPressed = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  // Modal and Overlay Shadows
  static const List<BoxShadow> modal = [
    BoxShadow(
      color: AppColors.shadowDark,
      offset: Offset(0, 8),
      blurRadius: 32,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> dropdown = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: -4,
    ),
  ];

  // App Bar and Navigation Shadows
  static const List<BoxShadow> appBar = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 1),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> navigationBar = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, -1),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  // Type-specific card shadows (for Pokemon types)
  static List<BoxShadow> getTypeCardShadow(String type) {
    final Color typeColor = AppColors.getTypeColor(type);
    return [
      BoxShadow(
        color: typeColor.withOpacity(0.2),
        offset: const Offset(0, 2),
        blurRadius: 8,
        spreadRadius: 0,
      ),
      const BoxShadow(
        color: AppColors.shadow,
        offset: Offset(0, 1),
        blurRadius: 4,
        spreadRadius: 0,
      ),
    ];
  }

  // Helper method to get elevation by level
  static double getElevationByLevel(int level) {
    switch (level) {
      case 0:
        return level0;
      case 1:
        return level1;
      case 2:
        return level2;
      case 3:
        return level3;
      case 4:
        return level4;
      case 5:
        return level5;
      case 6:
        return level6;
      case 7:
        return level7;
      case 8:
        return level8;
      default:
        return level0;
    }
  }

  // Helper method to get box shadow by level
  static List<BoxShadow> getBoxShadowByLevel(int level) {
    switch (level) {
      case 0:
        return none;
      case 1:
        return small;
      case 2:
        return medium;
      case 3:
        return large;
      case 4:
        return extraLarge;
      default:
        return none;
    }
  }
}