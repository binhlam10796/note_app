import 'package:flutter/material.dart';
import '../../design_system/app_colors.dart';
import '../../design_system/app_typography.dart';
import '../../design_system/app_elevations.dart';
import '../../models/pokemon_model.dart';
import '../../utils/pokemon_type_utils.dart';
import '../../gen/assets.gen.dart';

/// A card widget that displays Pokemon information according to Figma design specifications
class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onTap,
    this.width = 104,
    this.height = 108,
  });

  /// The Pokemon data to display
  final Pokemon pokemon;

  /// Callback function when the card is tapped
  final VoidCallback? onTap;

  /// Width of the card (default: 104)
  final double width;

  /// Height of the card (default: 108)
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppElevations.pokemonCardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Pokemon Image
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: _buildPokemonImage(),
              ),
            ),
            // Pokemon Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _buildPokemonInfo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: PokemonTypeUtils.getTypeLightColor(pokemon.primaryType),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Center(
        child: _getPokemonImageWidget(),
      ),
    );
  }

  Widget _getPokemonImageWidget() {
    // Map Pokemon names to available assets
    final Map<String, AssetGenImage> pokemonAssets = {
      'bulbasaur': Assets.svgs.bulbasaur,
      'charmander': Assets.svgs.charmander,
      'squirtle': Assets.svgs.squirtle,
      'pikachu': Assets.svgs.pikachu,
      'butterfree': Assets.svgs.butterfree,
      'gastly': Assets.svgs.gastly,
      'ditto': Assets.svgs.ditto,
      'mew': Assets.svgs.mew,
      'aron': Assets.svgs.aron,
    };

    final pokemonKey = pokemon.name.toLowerCase();
    final asset = pokemonAssets[pokemonKey];

    if (asset != null) {
      return asset.image(
        width: 62,
        height: 62,
        fit: BoxFit.contain,
      );
    } else {
      // Fallback to silhouette for unknown Pokemon
      return Assets.svgs.silhouette.image(
        width: 62,
        height: 62,
        fit: BoxFit.contain,
        color: AppColors.textLight,
      );
    }
  }

  Widget _buildPokemonInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Pokemon Number
        Text(
          pokemon.number,
          style: AppTypography.pokemonNumber.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        // Pokemon Name
        Text(
          pokemon.name,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        // Pokemon Types
        _buildTypeChips(),
      ],
    );
  }

  Widget _buildTypeChips() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pokemon.types.map((type) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: PokemonTypeUtils.getTypeColor(type),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            type.displayName,
            style: AppTypography.pokemonType.copyWith(
              color: PokemonTypeUtils.getTypeTextColor(type),
            ),
          ),
        );
      }).toList(),
    );
  }
}