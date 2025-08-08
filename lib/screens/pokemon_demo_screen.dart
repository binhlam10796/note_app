import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../widgets/pokemon_card.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class PokemonDemoScreen extends StatefulWidget {
  const PokemonDemoScreen({super.key});

  @override
  State<PokemonDemoScreen> createState() => _PokemonDemoScreenState();
}

class _PokemonDemoScreenState extends State<PokemonDemoScreen> {
  int? selectedCardIndex;
  bool showLargeCards = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.cardBackground,
        elevation: 0,
        title: Text(
          'Pokédex Cards Demo',
          style: AppTypography.h3.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showLargeCards = !showLargeCards;
                selectedCardIndex = null;
              });
            },
            icon: Icon(
              showLargeCards ? Icons.view_module : Icons.view_agenda,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              showLargeCards ? 'Large Cards View' : 'Grid Cards View',
              style: AppTypography.h4.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              showLargeCards 
                  ? 'Detailed view with more information'
                  : 'Compact grid layout for browsing',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            
            // Cards Display
            if (showLargeCards)
              _buildLargeCardsView()
            else
              _buildGridCardsView(),
            
            const SizedBox(height: 32),
            
            // Instructions
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Demo Instructions',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Tap cards to select them and see hover effects\n'
                    '• Use the view toggle in the app bar to switch between layouts\n'
                    '• Each card shows Pokemon type colors and styling\n'
                    '• Cards follow the Figma design specifications',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridCardsView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: SamplePokemonData.samplePokemons.length,
      itemBuilder: (context, index) {
        final pokemon = SamplePokemonData.samplePokemons[index];
        final isSelected = selectedCardIndex == index;
        
        return PokemonCard(
          pokemon: pokemon,
          isSelected: isSelected,
          onTap: () {
            setState(() {
              selectedCardIndex = isSelected ? null : index;
            });
          },
        );
      },
    );
  }

  Widget _buildLargeCardsView() {
    return Column(
      children: SamplePokemonData.samplePokemons.asMap().entries.map((entry) {
        final index = entry.key;
        final pokemon = entry.value;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: PokemonCardLarge(
            pokemon: pokemon,
            onTap: () {
              setState(() {
                selectedCardIndex = selectedCardIndex == index ? null : index;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}