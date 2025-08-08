import '../models/pokemon_model.dart';

/// Sample Pokemon data for testing and demonstration purposes
class PokemonData {
  PokemonData._();

  /// List of sample Pokemon
  static const List<Pokemon> samplePokemon = [
    Pokemon(
      id: '001',
      name: 'Bulbasaur',
      number: '#001',
      types: [PokemonType.grass, PokemonType.poison],
      imageAsset: 'assets/svgs/bulbasaur.png',
      height: 0.7,
      weight: 6.9,
      description: 'A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.',
    ),
    Pokemon(
      id: '004',
      name: 'Charmander',
      number: '#004',
      types: [PokemonType.fire],
      imageAsset: 'assets/svgs/charmander.png',
      height: 0.6,
      weight: 8.5,
      description: 'Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.',
    ),
    Pokemon(
      id: '007',
      name: 'Squirtle',
      number: '#007',
      types: [PokemonType.water],
      imageAsset: 'assets/svgs/squirtle.png',
      height: 0.5,
      weight: 9.0,
      description: 'After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.',
    ),
    Pokemon(
      id: '025',
      name: 'Pikachu',
      number: '#025',
      types: [PokemonType.electric],
      imageAsset: 'assets/svgs/pikachu.png',
      height: 0.4,
      weight: 6.0,
      description: 'When several of these Pokémon gather, their electricity could build and cause lightning storms.',
    ),
    Pokemon(
      id: '012',
      name: 'Butterfree',
      number: '#012',
      types: [PokemonType.bug, PokemonType.flying],
      imageAsset: 'assets/svgs/butterfree.png',
      height: 1.1,
      weight: 32.0,
      description: 'In battle, it flaps its wings at great speed to release highly toxic dust into the air.',
    ),
    Pokemon(
      id: '092',
      name: 'Gastly',
      number: '#092',
      types: [PokemonType.ghost, PokemonType.poison],
      imageAsset: 'assets/svgs/gastly.png',
      height: 1.3,
      weight: 0.1,
      description: 'Almost invisible, this gaseous Pokémon cloaks the target and puts it to sleep without notice.',
    ),
    Pokemon(
      id: '132',
      name: 'Ditto',
      number: '#132',
      types: [PokemonType.normal],
      imageAsset: 'assets/svgs/ditto.png',
      height: 0.3,
      weight: 4.0,
      description: 'Capable of copying an enemy\'s genetic code to instantly transform itself into a duplicate of the enemy.',
    ),
    Pokemon(
      id: '151',
      name: 'Mew',
      number: '#151',
      types: [PokemonType.psychic],
      imageAsset: 'assets/svgs/mew.png',
      height: 0.4,
      weight: 4.0,
      description: 'So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide.',
    ),
    Pokemon(
      id: '304',
      name: 'Aron',
      number: '#304',
      types: [PokemonType.steel, PokemonType.rock],
      imageAsset: 'assets/svgs/aron.png',
      height: 0.4,
      weight: 60.0,
      description: 'This Pokémon has a body of steel. To make its body, Aron feeds on iron ore that it digs from mountains.',
    ),
  ];

  /// Get a Pokemon by ID
  static Pokemon? getPokemonById(String id) {
    try {
      return samplePokemon.firstWhere((pokemon) => pokemon.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Get a Pokemon by name
  static Pokemon? getPokemonByName(String name) {
    try {
      return samplePokemon.firstWhere(
        (pokemon) => pokemon.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Get Pokemon by type
  static List<Pokemon> getPokemonByType(PokemonType type) {
    return samplePokemon.where((pokemon) => pokemon.types.contains(type)).toList();
  }

  /// Get all available Pokemon
  static List<Pokemon> getAllPokemon() {
    return List.from(samplePokemon);
  }
}