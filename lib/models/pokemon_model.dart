/// Pokemon data model for the Pokédex widget
class Pokemon {
  const Pokemon({
    required this.id,
    required this.name,
    required this.number,
    required this.types,
    required this.imageAsset,
    this.height,
    this.weight,
    this.description,
  });

  /// Unique identifier for the Pokemon
  final String id;

  /// Pokemon name (e.g., "Pikachu")
  final String name;

  /// Pokemon number in the Pokédex (e.g., "#025")
  final String number;

  /// List of Pokemon types (e.g., ["Electric"])
  final List<PokemonType> types;

  /// Asset path for the Pokemon image
  final String imageAsset;

  /// Pokemon height in meters (optional)
  final double? height;

  /// Pokemon weight in kilograms (optional)
  final double? weight;

  /// Pokemon description (optional)
  final String? description;

  /// Primary type getter for easy access
  PokemonType get primaryType => types.first;

  /// Secondary type getter (null if Pokemon has only one type)
  PokemonType? get secondaryType => types.length > 1 ? types[1] : null;

  /// Check if Pokemon has multiple types
  bool get hasMultipleTypes => types.length > 1;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pokemon && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name, number: $number, types: $types}';
  }
}

/// Pokemon type enumeration
enum PokemonType {
  normal,
  fire,
  water,
  electric,
  grass,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy,
}

/// Extension to get display name for Pokemon types
extension PokemonTypeExtension on PokemonType {
  /// Get the display name for the Pokemon type
  String get displayName {
    switch (this) {
      case PokemonType.normal:
        return 'Normal';
      case PokemonType.fire:
        return 'Fire';
      case PokemonType.water:
        return 'Water';
      case PokemonType.electric:
        return 'Electric';
      case PokemonType.grass:
        return 'Grass';
      case PokemonType.ice:
        return 'Ice';
      case PokemonType.fighting:
        return 'Fighting';
      case PokemonType.poison:
        return 'Poison';
      case PokemonType.ground:
        return 'Ground';
      case PokemonType.flying:
        return 'Flying';
      case PokemonType.psychic:
        return 'Psychic';
      case PokemonType.bug:
        return 'Bug';
      case PokemonType.rock:
        return 'Rock';
      case PokemonType.ghost:
        return 'Ghost';
      case PokemonType.dragon:
        return 'Dragon';
      case PokemonType.dark:
        return 'Dark';
      case PokemonType.steel:
        return 'Steel';
      case PokemonType.fairy:
        return 'Fairy';
    }
  }
}