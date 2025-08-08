import 'package:flutter/material.dart';
import '../widgets/pokemon_card.dart';
import '../data/pokemon_data.dart';
import '../design_system/app_colors.dart';
import '../design_system/app_typography.dart';

/// Demo page showcasing the PokemonCard widget
class PokemonDemo extends StatelessWidget {
  const PokemonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Pokémon Cards Demo',
          style: AppTypography.headlineMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pokémon Card Widget',
              style: AppTypography.headlineSmall.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This demonstrates the PokemonCard widget implementation following Figma design specifications.',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 104 / 108,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: PokemonData.samplePokemon.length,
                itemBuilder: (context, index) {
                  final pokemon = PokemonData.samplePokemon[index];
                  return PokemonCard(
                    pokemon: pokemon,
                    onTap: () {
                      _showPokemonDetails(context, pokemon);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPokemonDetails(BuildContext context, pokemon) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          pokemon.name,
          style: AppTypography.headlineSmall.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number: ${pokemon.number}',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Types: ${pokemon.types.map((t) => t.displayName).join(', ')}',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            if (pokemon.height != null) ...[
              const SizedBox(height: 8),
              Text(
                'Height: ${pokemon.height}m',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
            if (pokemon.weight != null) ...[
              const SizedBox(height: 8),
              Text(
                'Weight: ${pokemon.weight}kg',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
            if (pokemon.description != null) ...[
              const SizedBox(height: 12),
              Text(
                pokemon.description!,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: AppTypography.labelLarge.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}