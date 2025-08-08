import 'package:flutter/material.dart';

/// AppElevations class containing all elevation and shadow definitions for the Pokédex app
/// Based on the Style Guide from the Figma design specifications
class AppElevations {
  AppElevations._();

  // Elevation levels
  static const double level0 = 0.0;
  static const double level1 = 1.0;
  static const double level2 = 3.0;
  static const double level3 = 6.0;
  static const double level4 = 8.0;
  static const double level5 = 12.0;

  // Card elevations
  static const double cardElevation = level2;
  static const double cardHoverElevation = level4;
  static const double cardPressedElevation = level1;

  // Button elevations
  static const double buttonElevation = level2;
  static const double buttonHoverElevation = level4;
  static const double buttonPressedElevation = level1;

  // Dialog elevations
  static const double dialogElevation = level5;
  static const double modalElevation = level4;

  // App bar elevations
  static const double appBarElevation = level1;

  // Pokemon card specific elevations
  static const double pokemonCardElevation = level2;
  static const double pokemonCardHoverElevation = level3;

  // Shadow definitions for custom shadows
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> cardHoverShadow = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> pokemonCardShadow = [
    BoxShadow(
      color: Color(0x12000000),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> pokemonCardHoverShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 1),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> buttonHoverShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> dialogShadow = [
    BoxShadow(
      color: Color(0x26000000),
      offset: Offset(0, 8),
      blurRadius: 16,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  // Inner shadows (can be achieved with custom painters or container decorations)
  static const List<BoxShadow> innerShadow = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: -1,
    ),
  ];

  // Type-specific shadows for Pokemon cards
  static const List<BoxShadow> fireTypeShadow = [
    BoxShadow(
      color: Color(0x33F08030),
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> waterTypeShadow = [
    BoxShadow(
      color: Color(0x336890F0),
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> grassTypeShadow = [
    BoxShadow(
      color: Color(0x3378C850),
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> electricTypeShadow = [
    BoxShadow(
      color: Color(0x33F8D030),
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ];

  /// Get type-specific shadow for Pokemon cards
  static List<BoxShadow> getTypeShadow(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return fireTypeShadow;
      case 'water':
        return waterTypeShadow;
      case 'grass':
        return grassTypeShadow;
      case 'electric':
        return electricTypeShadow;
      default:
        return pokemonCardShadow;
    }
  }

  /// Get hover shadow for Pokemon cards based on type
  static List<BoxShadow> getTypeHoverShadow(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return [
          ...fireTypeShadow,
          ...pokemonCardHoverShadow,
        ];
      case 'water':
        return [
          ...waterTypeShadow,
          ...pokemonCardHoverShadow,
        ];
      case 'grass':
        return [
          ...grassTypeShadow,
          ...pokemonCardHoverShadow,
        ];
      case 'electric':
        return [
          ...electricTypeShadow,
          ...pokemonCardHoverShadow,
        ];
      default:
        return pokemonCardHoverShadow;
    }
  }
}