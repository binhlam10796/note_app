import 'package:flutter/material.dart';
import '../design_system/app_colors.dart';
import '../models/pokemon_model.dart';

/// Utility class for Pokemon type-related functionality
class PokemonTypeUtils {
  PokemonTypeUtils._();

  /// Get the color associated with a Pokemon type
  static Color getTypeColor(PokemonType type) {
    switch (type) {
      case PokemonType.normal:
        return AppColors.typeNormal;
      case PokemonType.fire:
        return AppColors.typeFire;
      case PokemonType.water:
        return AppColors.typeWater;
      case PokemonType.electric:
        return AppColors.typeElectric;
      case PokemonType.grass:
        return AppColors.typeGrass;
      case PokemonType.ice:
        return AppColors.typeIce;
      case PokemonType.fighting:
        return AppColors.typeFighting;
      case PokemonType.poison:
        return AppColors.typePoison;
      case PokemonType.ground:
        return AppColors.typeGround;
      case PokemonType.flying:
        return AppColors.typeFlying;
      case PokemonType.psychic:
        return AppColors.typePsychic;
      case PokemonType.bug:
        return AppColors.typeBug;
      case PokemonType.rock:
        return AppColors.typeRock;
      case PokemonType.ghost:
        return AppColors.typeGhost;
      case PokemonType.dragon:
        return AppColors.typeDragon;
      case PokemonType.dark:
        return AppColors.typeDark;
      case PokemonType.steel:
        return AppColors.typeSteel;
      case PokemonType.fairy:
        return AppColors.typeFairy;
    }
  }

  /// Get a lighter version of the type color for backgrounds
  static Color getTypeLightColor(PokemonType type) {
    final baseColor = getTypeColor(type);
    return baseColor.withOpacity(0.2);
  }

  /// Get text color that contrasts well with the type color
  static Color getTypeTextColor(PokemonType type) {
    final color = getTypeColor(type);
    // Calculate luminance to determine if we should use light or dark text
    final luminance = color.computeLuminance();
    return luminance > 0.5 ? AppColors.textPrimary : Colors.white;
  }

  /// Parse Pokemon type from string
  static PokemonType? parseType(String typeString) {
    try {
      return PokemonType.values.firstWhere(
        (type) => type.name.toLowerCase() == typeString.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Get all available Pokemon types
  static List<PokemonType> getAllTypes() {
    return PokemonType.values;
  }
}