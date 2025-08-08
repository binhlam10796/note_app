import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../widgets/pokemon_card.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';

/// Demo page showing Pokemon cards in action
class PokemonCardDemo extends StatelessWidget {
  const PokemonCardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Pokédex Cards',
          style: AppTypography.h3.copyWith(
            color: AppColors.textOnPrimary,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: PokemonCardGrid(
        pokemonList: _getSamplePokemon(),
        onPokemonTap: (pokemon) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Selected ${pokemon.capitalizedName}!'),
              backgroundColor: AppColors.getTypeColor(pokemon.primaryType),
            ),
          );
        },
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
    );
  }

  /// Generate sample Pokemon data for demonstration
  List<Pokemon> _getSamplePokemon() {
    return [
      const Pokemon(
        id: 1,
        name: 'bulbasaur',
        number: '001',
        types: ['grass', 'poison'],
        imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
        description: 'A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.',
        abilities: ['Overgrow', 'Chlorophyll'],
        height: 0.7,
        weight: 6.9,
      ),
      const Pokemon(
        id: 4,
        name: 'charmander',
        number: '004',
        types: ['fire'],
        imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
        description: 'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.',
        abilities: ['Blaze', 'Solar Power'],
        height: 0.6,
        weight: 8.5,
      ),
      const Pokemon(
        id: 7,
        name: 'squirtle',
        number: '007',
        types: ['water'],
        imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
        description: 'After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.',
        abilities: ['Torrent', 'Rain Dish'],
        height: 0.5,
        weight: 9.0,
      ),
      const Pokemon(
        id: 25,
        name: 'pikachu',
        number: '025',
        types: ['electric'],
        imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
        description: 'When several of these Pokémon gather, their electricity could build and cause lightning storms.',
        abilities: ['Static', 'Lightning Rod'],
        height: 0.4,
        weight: 6.0,
      ),
      const Pokemon(
        id: 150,
        name: 'mewtwo',
        number: '150',
        types: ['psychic'],
        imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png',
        description: 'It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.',
        abilities: ['Pressure', 'Unnerve'],
        height: 2.0,
        weight: 122.0,
      ),
      const Pokemon(
        id: 144,
        name: 'articuno',
        number: '144',
        types: ['ice', 'flying'],
        imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/144.png',
        description: 'A legendary bird Pokémon that is said to appear to doomed people who are lost in icy mountains.',
        abilities: ['Pressure', 'Snow Cloak'],
        height: 1.7,
        weight: 55.4,
      ),
    ];
  }
}

/// Alternative single card demo for testing individual cards
class SinglePokemonCardDemo extends StatelessWidget {
  const SinglePokemonCardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const samplePokemon = Pokemon(
      id: 6,
      name: 'charizard',
      number: '006',
      types: ['fire', 'flying'],
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
      description: 'Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.',
      abilities: ['Blaze', 'Solar Power'],
      height: 1.7,
      weight: 90.5,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Single Pokémon Card Demo',
          style: AppTypography.h4.copyWith(
            color: AppColors.textOnPrimary,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PokemonCard(
            pokemon: samplePokemon,
            width: 200,
            height: 280,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Tapped ${samplePokemon.capitalizedName}!'),
                  backgroundColor: AppColors.getTypeColor(samplePokemon.primaryType),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}