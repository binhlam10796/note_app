import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_elevations.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String imageAsset;
  final List<String> types;
  final Color backgroundColor;

  const PokemonCard({
    Key? key,
    required this.name,
    required this.imageAsset,
    required this.types,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppElevations.card,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pokemon name
            Text(
              name,
              style: AppTypography.h6.copyWith(
                color: AppColors.onPrimary,
              ),
            ),
            const SizedBox(height: 4),
            // Pokemon types
            Wrap(
              spacing: 4,
              children: types
                  .map((type) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.onPrimary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          type,
                          style: AppTypography.caption.copyWith(
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const Spacer(),
            // Pokemon image
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                imageAsset,
                height: 80,
                width: 80,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample Pokemon data for demo purposes
class PokemonData {
  static List<Map<String, dynamic>> getSamplePokemon() {
    return [
      {
        'name': 'Bulbasaur',
        'image': Assets.svgs.bulbasaur.path,
        'types': ['Grass', 'Poison'],
        'color': const Color(0xFF48D0B0),
      },
      {
        'name': 'Charmander',
        'image': Assets.svgs.charmander.path,
        'types': ['Fire'],
        'color': const Color(0xFFFC6C6D),
      },
      {
        'name': 'Squirtle',
        'image': Assets.svgs.squirtle.path,
        'types': ['Water'],
        'color': const Color(0xFF76BCFD),
      },
      {
        'name': 'Pikachu',
        'image': Assets.svgs.pikachu.path,
        'types': ['Electric'],
        'color': const Color(0xFFFFD86F),
      },
      {
        'name': 'Gastly',
        'image': Assets.svgs.gastly.path,
        'types': ['Ghost', 'Poison'],
        'color': const Color(0xFF7C5BBB),
      },
      {
        'name': 'Ditto',
        'image': Assets.svgs.ditto.path,
        'types': ['Normal'],
        'color': const Color(0xFFB0A5C7),
      },
      {
        'name': 'Mew',
        'image': Assets.svgs.mew.path,
        'types': ['Psychic'],
        'color': const Color(0xFFEE99AC),
      },
      {
        'name': 'Butterfree',
        'image': Assets.svgs.butterfree.path,
        'types': ['Bug', 'Flying'],
        'color': const Color(0xFF48D0B0),
      },
    ];
  }
}