import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Application elevation constants based on the Pokédex design system
class AppElevations {
  AppElevations._();

  // Card Elevations
  static const double cardElevation = 2.0;
  static const double cardHoverElevation = 4.0;
  static const double cardPressedElevation = 1.0;

  // Button Elevations
  static const double buttonElevation = 2.0;
  static const double buttonHoverElevation = 4.0;
  static const double buttonPressedElevation = 1.0;

  // Modal Elevations
  static const double modalElevation = 8.0;
  static const double overlayElevation = 16.0;

  // Custom Box Shadows
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: AppColors.cardShadow,
      blurRadius: 8.0,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> cardHoverShadow = [
    BoxShadow(
      color: AppColors.cardShadow,
      blurRadius: 16.0,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> cardPressedShadow = [
    BoxShadow(
      color: AppColors.cardShadow,
      blurRadius: 4.0,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  // Pokemon Card Specific Shadows
  static const List<BoxShadow> pokemonCardShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 12.0,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 4.0,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> pokemonCardHoverShadow = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 20.0,
      offset: Offset(0, 8),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8.0,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  // Button Shadows
  static const List<BoxShadow> buttonShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 6.0,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> buttonHoverShadow = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 12.0,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
  ];

  // Type Badge Shadows
  static const List<BoxShadow> typeBadgeShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4.0,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  // Modal and Overlay Shadows
  static const List<BoxShadow> modalShadow = [
    BoxShadow(
      color: Color(0x33000000),
      blurRadius: 24.0,
      offset: Offset(0, 8),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> overlayShadow = [
    BoxShadow(
      color: Color(0x4D000000),
      blurRadius: 32.0,
      offset: Offset(0, 16),
      spreadRadius: 0,
    ),
  ];
}