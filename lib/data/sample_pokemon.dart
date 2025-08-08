import '../models/pokemon.dart';

/// Sample Pokemon data for demonstration purposes
/// These would typically come from an API or database
class SamplePokemon {
  static const List<Pokemon> pokemonList = [
    Pokemon(
      id: '1',
      name: 'Bulbasaur',
      number: '001',
      types: ['grass', 'poison'],
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
      description: 'A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.',
      category: 'Seed Pokémon',
      height: 0.7,
      weight: 6.9,
      abilities: ['Overgrow', 'Chlorophyll'],
      stats: {
        'hp': 45,
        'attack': 49,
        'defense': 49,
        'special-attack': 65,
        'special-defense': 65,
        'speed': 45,
      },
      region: 'Kanto',
    ),
    Pokemon(
      id: '4',
      name: 'Charmander',
      number: '004',
      types: ['fire'],
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
      description: 'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.',
      category: 'Lizard Pokémon',
      height: 0.6,
      weight: 8.5,
      abilities: ['Blaze', 'Solar Power'],
      stats: {
        'hp': 39,
        'attack': 52,
        'defense': 43,
        'special-attack': 60,
        'special-defense': 50,
        'speed': 65,
      },
      region: 'Kanto',
    ),
    Pokemon(
      id: '7',
      name: 'Squirtle',
      number: '007',
      types: ['water'],
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
      description: 'After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.',
      category: 'Tiny Turtle Pokémon',
      height: 0.5,
      weight: 9.0,
      abilities: ['Torrent', 'Rain Dish'],
      stats: {
        'hp': 44,
        'attack': 48,
        'defense': 65,
        'special-attack': 50,
        'special-defense': 64,
        'speed': 43,
      },
      region: 'Kanto',
    ),
    Pokemon(
      id: '25',
      name: 'Pikachu',
      number: '025',
      types: ['electric'],
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
      description: 'When several of these Pokémon gather, their electricity could build and cause lightning storms.',
      category: 'Mouse Pokémon',
      height: 0.4,
      weight: 6.0,
      abilities: ['Static', 'Lightning Rod'],
      stats: {
        'hp': 35,
        'attack': 55,
        'defense': 40,
        'special-attack': 50,
        'special-defense': 50,
        'speed': 90,
      },
      region: 'Kanto',
    ),
    Pokemon(
      id: '150',
      name: 'Mewtwo',
      number: '150',
      types: ['psychic'],
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png',
      description: 'It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.',
      category: 'Genetic Pokémon',
      height: 2.0,
      weight: 122.0,
      abilities: ['Pressure', 'Unnerve'],
      stats: {
        'hp': 106,
        'attack': 110,
        'defense': 90,
        'special-attack': 154,
        'special-defense': 90,
        'speed': 130,
      },
      region: 'Kanto',
    ),
    Pokemon(
      id: '144',
      name: 'Articuno',
      number: '144',
      types: ['ice', 'flying'],
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/144.png',
      description: 'A legendary bird Pokémon that is said to appear to doomed people who are lost in icy mountains.',
      category: 'Freeze Pokémon',
      height: 1.7,
      weight: 55.4,
      abilities: ['Pressure', 'Snow Cloak'],
      stats: {
        'hp': 90,
        'attack': 85,
        'defense': 100,
        'special-attack': 95,
        'special-defense': 125,
        'speed': 85,
      },
      region: 'Kanto',
    ),
  ];

  /// Get a Pokemon by ID
  static Pokemon? getPokemonById(String id) {
    try {
      return pokemonList.firstWhere((pokemon) => pokemon.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get Pokemon by type
  static List<Pokemon> getPokemonByType(String type) {
    return pokemonList.where((pokemon) =>
        pokemon.types.contains(type.toLowerCase())).toList();
  }

  /// Get random Pokemon
  static Pokemon getRandomPokemon() {
    return pokemonList[(DateTime.now().millisecondsSinceEpoch % pokemonList.length)];
  }

  /// Get Pokemon by region
  static List<Pokemon> getPokemonByRegion(String region) {
    return pokemonList.where((pokemon) =>
        pokemon.region?.toLowerCase() == region.toLowerCase()).toList();
  }
}