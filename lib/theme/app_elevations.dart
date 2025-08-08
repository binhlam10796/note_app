import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Elevation styles for the Pokédex application
class AppElevations {
  AppElevations._();

  // Elevation level 1 - subtle shadow for cards
  static const List<BoxShadow> level1 = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
  ];

  // Elevation level 2 - moderate shadow for floating elements
  static const List<BoxShadow> level2 = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
    ),
  ];

  // Elevation level 3 - prominent shadow for dialogs and sheets
  static const List<BoxShadow> level3 = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 0,
    ),
  ];

  // Elevation level 4 - strong shadow for modals
  static const List<BoxShadow> level4 = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 8),
      blurRadius: 16,
      spreadRadius: 0,
    ),
  ];

  // Elevation level 5 - maximum shadow for overlays
  static const List<BoxShadow> level5 = [
    BoxShadow(
      color: AppColors.shadowDark,
      offset: Offset(0, 12),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ];

  // Custom elevation for filter dialog
  static const List<BoxShadow> filterDialog = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  // Custom elevation for app bar
  static const List<BoxShadow> appBar = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  // Custom elevation for cards
  static const List<BoxShadow> card = [
    BoxShadow(
      color: AppColors.shadow,
      offset: Offset(0, 1),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];
}