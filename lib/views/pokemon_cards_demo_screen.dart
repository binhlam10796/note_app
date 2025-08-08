import 'package:flutter/material.dart';
import '../widgets/pokemon_card.dart';
import '../data/sample_pokemon.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Demo screen showcasing the PokemonCard widget
/// Demonstrates different configurations and use cases
class PokemonCardsDemoScreen extends StatelessWidget {
  const PokemonCardsDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Pokémon Cards Demo',
          style: AppTypography.headlineMedium.copyWith(
            color: AppColors.textLight,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Standard Cards'),
            const SizedBox(height: 16),
            _buildStandardCardsGrid(),
            
            const SizedBox(height: 32),
            
            _buildSectionHeader('Cards with Stats'),
            const SizedBox(height: 16),
            _buildStatsCardsGrid(),
            
            const SizedBox(height: 32),
            
            _buildSectionHeader('Compact Cards'),
            const SizedBox(height: 16),
            _buildCompactCardsGrid(),
            
            const SizedBox(height: 32),
            
            _buildSectionHeader('Different Types Showcase'),
            const SizedBox(height: 16),
            _buildTypesShowcase(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTypography.headlineSmall.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildStandardCardsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        final pokemon = SamplePokemon.pokemonList[index];
        return PokemonCard(
          pokemon: pokemon,
          onTap: () => _showPokemonDetails(context, pokemon),
        );
      },
    );
  }

  Widget _buildStatsCardsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        final pokemon = SamplePokemon.pokemonList[index];
        return PokemonCard(
          pokemon: pokemon,
          showStats: true,
          onTap: () => _showPokemonDetails(context, pokemon),
        );
      },
    );
  }

  Widget _buildCompactCardsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        final pokemon = SamplePokemon.pokemonList[index];
        return PokemonCard(
          pokemon: pokemon,
          isCompact: true,
          onTap: () => _showPokemonDetails(context, pokemon),
        );
      },
    );
  }

  Widget _buildTypesShowcase() {
    final typeExamples = [
      SamplePokemon.pokemonList[0], // Grass
      SamplePokemon.pokemonList[1], // Fire
      SamplePokemon.pokemonList[2], // Water
      SamplePokemon.pokemonList[3], // Electric
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: typeExamples.map((pokemon) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: PokemonCard(
              pokemon: pokemon,
              width: 180,
              height: 260,
              showStats: true,
              onTap: () => _showPokemonDetails(context, pokemon),
            ),
          );
        }).toList(),
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
          style: AppTypography.headlineSmall.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.formattedNumber,
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${pokemon.category}',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Types: ${pokemon.types.join(', ')}',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Height: ${pokemon.formattedHeight}',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Weight: ${pokemon.formattedWeight}',
              style: AppTypography.bodyMedium,
            ),
            const SizedBox(height: 12),
            Text(
              'Description:',
              style: AppTypography.titleSmall,
            ),
            const SizedBox(height: 4),
            Text(
              pokemon.description,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: AppTypography.buttonMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}