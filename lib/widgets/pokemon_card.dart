import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';
import '../core/theme/app_elevations.dart';
import '../models/pokemon_model.dart';
import '../gen/assets.gen.dart';

/// A reusable Pokemon card widget that displays Pokemon information
/// following the Figma design specifications
class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final primaryTypeColor = AppColors.getTypeColor(pokemon.primaryType);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 160,
        height: height ?? 200,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppElevations.pokemonCard,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Background gradient based on primary type
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryTypeColor.withOpacity(0.1),
                      primaryTypeColor.withOpacity(0.05),
                    ],
                  ),
                ),
              ),
              
              // Pokeball background pattern
              Positioned(
                right: -20,
                top: -20,
                child: Opacity(
                  opacity: 0.1,
                  child: Assets.svgs.pokeball.svg(
                    width: 80,
                    height: 80,
                    colorFilter: ColorFilter.mode(
                      primaryTypeColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pokemon number
                    Text(
                      pokemon.formattedNumber,
                      style: AppTypography.pokemonNumber.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // Pokemon name
                    Text(
                      pokemon.name,
                      style: AppTypography.pokemonName.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Pokemon types
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: pokemon.types.map((type) {
                        return _buildTypeChip(type);
                      }).toList(),
                    ),
                    
                    const Spacer(),
                    
                    // Pokemon image
                    Center(
                      child: _buildPokemonImage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeChip(String type) {
    final typeColor = AppColors.getTypeColor(type);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: typeColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: typeColor.withOpacity(0.4),
          width: 1,
        ),
      ),
      child: Text(
        type.toUpperCase(),
        style: AppTypography.pokemonType.copyWith(
          color: typeColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    // Try to get the pokemon image from assets
    Widget pokemonImage;
    
    try {
      // Check if we have a specific asset for this pokemon
      switch (pokemon.name.toLowerCase()) {
        case 'bulbasaur':
          pokemonImage = Assets.svgs.bulbasaur.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        case 'charmander':
          pokemonImage = Assets.svgs.charmander.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        case 'squirtle':
          pokemonImage = Assets.svgs.squirtle.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        case 'pikachu':
          pokemonImage = Assets.svgs.pikachu.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        case 'butterfree':
          pokemonImage = Assets.svgs.butterfree.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        case 'gastly':
          pokemonImage = Assets.svgs.gastly.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        case 'ditto':
          pokemonImage = Assets.svgs.ditto.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        case 'mew':
          pokemonImage = Assets.svgs.mew.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        case 'aron':
          pokemonImage = Assets.svgs.aron.image(
            width: 80,
            height: 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
          );
          break;
        default:
          pokemonImage = _buildFallbackImage();
      }
    } catch (e) {
      pokemonImage = _buildFallbackImage();
    }
    
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: pokemonImage,
    );
  }

  Widget _buildFallbackImage() {
    try {
      return Assets.svgs.silhouette.image(
        width: 80,
        height: 80,
        fit: BoxFit.contain,
        color: AppColors.textTertiary,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.textTertiary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.catching_pokemon,
            size: 40,
            color: AppColors.textTertiary,
          ),
        ),
      );
    } catch (e) {
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.textTertiary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.catching_pokemon,
          size: 40,
          color: AppColors.textTertiary,
        ),
      );
    }
  }
}