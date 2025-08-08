import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App elevation and shadow styles based on Pokédex design system
class AppElevations {
  AppElevations._();

  // Elevation levels
  static const double level0 = 0;
  static const double level1 = 1;
  static const double level2 = 3;
  static const double level3 = 6;
  static const double level4 = 8;
  static const double level5 = 12;

  // Box shadows for custom implementations
  static const List<BoxShadow> shadowLevel0 = [];

  static const List<BoxShadow> shadowLevel1 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
      color: AppColors.shadowLight,
    ),
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 1,
      spreadRadius: 0,
      color: AppColors.shadow,
    ),
  ];

  static const List<BoxShadow> shadowLevel2 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 5,
      spreadRadius: 0,
      color: AppColors.shadowLight,
    ),
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 2,
      spreadRadius: 0,
      color: AppColors.shadow,
    ),
  ];

  static const List<BoxShadow> shadowLevel3 = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 10,
      spreadRadius: 0,
      color: AppColors.shadowLight,
    ),
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 5,
      spreadRadius: 0,
      color: AppColors.shadow,
    ),
  ];

  static const List<BoxShadow> shadowLevel4 = [
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 16,
      spreadRadius: 0,
      color: AppColors.shadowLight,
    ),
    BoxShadow(
      offset: Offset(0, 6),
      blurRadius: 10,
      spreadRadius: 0,
      color: AppColors.shadow,
    ),
  ];

  static const List<BoxShadow> shadowLevel5 = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 20,
      spreadRadius: 0,
      color: AppColors.shadowLight,
    ),
    BoxShadow(
      offset: Offset(0, 8),
      blurRadius: 10,
      spreadRadius: 0,
      color: AppColors.shadow,
    ),
  ];

  // Pokemon card specific shadows
  static const List<BoxShadow> pokemonCardShadow = [
    BoxShadow(
      offset: Offset(0, 5),
      blurRadius: 15,
      spreadRadius: 0,
      color: Color(0x14000000),
    ),
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
      color: Color(0x1F000000),
    ),
  ];

  static const List<BoxShadow> pokemonCardHoverShadow = [
    BoxShadow(
      offset: Offset(0, 8),
      blurRadius: 25,
      spreadRadius: 0,
      color: Color(0x1A000000),
    ),
    BoxShadow(
      offset: Offset(0, 3),
      blurRadius: 10,
      spreadRadius: 0,
      color: Color(0x24000000),
    ),
  ];
}