import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_typography.dart';
import '../models/pokemon_model.dart';
import '../widgets/pokemon_card.dart';

/// Demo view to showcase the Pokemon card implementation
class PokemonDemoView extends StatelessWidget {
  const PokemonDemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Pokédex Cards',
          style: AppTypography.headline2.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pokemon Card Examples',
              style: AppTypography.headline3.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Based on the Figma design system',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: SamplePokemonData.samplePokemon.length,
                itemBuilder: (context, index) {
                  final pokemon = SamplePokemonData.samplePokemon[index];
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

  void _showPokemonDetails(BuildContext context, Pokemon pokemon) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          pokemon.name,
          style: AppTypography.headline3.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number: ${pokemon.formattedNumber}',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Types: ${pokemon.types.join(', ')}',
              style: AppTypography.body2.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            if (pokemon.description != null) ...[
              const SizedBox(height: 12),
              Text(
                pokemon.description!,
                style: AppTypography.body2.copyWith(
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
              style: AppTypography.button.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}