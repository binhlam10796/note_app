import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/pokemon.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_elevations.dart';
import '../gen/assets.gen.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;
  final bool isSelected;
  final double? width;
  final double? height;

  const PokemonCard({
    super.key,
    required this.pokemon,
    this.onTap,
    this.isSelected = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final primaryTypeColor = AppColors.getTypeColor(pokemon.primaryType);
    
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width ?? 160,
        height: height ?? 220,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryTypeColor.withOpacity(0.1),
              primaryTypeColor.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected 
                ? primaryTypeColor 
                : AppColors.border,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected 
              ? AppElevations.pokemonCardHovered
              : AppElevations.pokemonCard,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background pattern/decoration
              Positioned(
                top: -20,
                right: -20,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryTypeColor.withOpacity(0.1),
                  ),
                ),
              ),
              
              // Pokemon number
              Positioned(
                top: 12,
                right: 12,
                child: Text(
                  '#${pokemon.formattedNumber}',
                  style: AppTypography.pokemonNumber.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              
              // Pokemon image
              Positioned(
                top: 32,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 100,
                  child: _buildPokemonImage(),
                ),
              ),
              
              // Card content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                      _buildTypeChips(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    // Try to get the Pokemon image from generated assets
    try {
      // For now, we'll use a placeholder since we can't download the actual images
      // In a real implementation, this would reference the actual Pokemon images
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.getTypeColor(pokemon.primaryType).withOpacity(0.2),
        ),
        child: Center(
          child: Icon(
            Icons.catching_pokemon,
            size: 60,
            color: AppColors.getTypeColor(pokemon.primaryType),
          ),
        ),
      );
    } catch (e) {
      // Fallback to placeholder
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.getTypeColor(pokemon.primaryType).withOpacity(0.2),
        ),
        child: Center(
          child: Icon(
            Icons.catching_pokemon,
            size: 60,
            color: AppColors.getTypeColor(pokemon.primaryType),
          ),
        ),
      );
    }
  }

  Widget _buildTypeChips() {
    return Row(
      children: pokemon.types.map((type) => _buildTypeChip(type)).toList(),
    );
  }

  Widget _buildTypeChip(String type) {
    final typeColor = AppColors.getTypeColor(type);
    
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: typeColor.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Text(
        type.toUpperCase(),
        style: AppTypography.pokemonType.copyWith(
          color: AppColors.textWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// Large Pokemon Card variant for detailed view
class PokemonCardLarge extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;

  const PokemonCardLarge({
    super.key,
    required this.pokemon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryTypeColor = AppColors.getTypeColor(pokemon.primaryType);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryTypeColor.withOpacity(0.15),
              primaryTypeColor.withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
          boxShadow: AppElevations.large,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with number and name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#${pokemon.formattedNumber}',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pokemon.name,
                        style: AppTypography.h3.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Pokemon image (larger)
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryTypeColor.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.catching_pokemon,
                      size: 80,
                      color: primaryTypeColor,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Types
            Row(
              children: pokemon.types
                  .map((type) => _buildLargeTypeChip(type))
                  .toList(),
            ),
            
            if (pokemon.description != null) ...[
              const SizedBox(height: 16),
              Text(
                pokemon.description!,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            
            if (pokemon.height != null || pokemon.weight != null) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  if (pokemon.height != null) ...[
                    _buildStatItem('Height', '${pokemon.height} m'),
                    const SizedBox(width: 24),
                  ],
                  if (pokemon.weight != null)
                    _buildStatItem('Weight', '${pokemon.weight} kg'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLargeTypeChip(String type) {
    final typeColor = AppColors.getTypeColor(type);
    
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: typeColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: typeColor.withOpacity(0.3),
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Text(
        type.toUpperCase(),
        style: AppTypography.labelMedium.copyWith(
          color: AppColors.textWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}