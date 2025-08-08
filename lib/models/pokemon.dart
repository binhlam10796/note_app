/// Pokemon data model class for the Pokédex app
/// Contains all necessary properties for displaying Pokemon information
class Pokemon {
  final String id;
  final String name;
  final String number;
  final List<String> types;
  final String imageUrl;
  final String description;
  final String category;
  final double height;
  final double weight;
  final List<String> abilities;
  final Map<String, int> stats;
  final String? evolutionChain;
  final String? region;

  const Pokemon({
    required this.id,
    required this.name,
    required this.number,
    required this.types,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    this.evolutionChain,
    this.region,
  });

  /// Create Pokemon from JSON
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as String,
      name: json['name'] as String,
      number: json['number'] as String,
      types: List<String>.from(json['types'] as List),
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      abilities: List<String>.from(json['abilities'] as List),
      stats: Map<String, int>.from(json['stats'] as Map),
      evolutionChain: json['evolutionChain'] as String?,
      region: json['region'] as String?,
    );
  }

  /// Convert Pokemon to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'types': types,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'height': height,
      'weight': weight,
      'abilities': abilities,
      'stats': stats,
      'evolutionChain': evolutionChain,
      'region': region,
    };
  }

  /// Create a copy of Pokemon with updated fields
  Pokemon copyWith({
    String? id,
    String? name,
    String? number,
    List<String>? types,
    String? imageUrl,
    String? description,
    String? category,
    double? height,
    double? weight,
    List<String>? abilities,
    Map<String, int>? stats,
    String? evolutionChain,
    String? region,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      types: types ?? this.types,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      category: category ?? this.category,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      abilities: abilities ?? this.abilities,
      stats: stats ?? this.stats,
      evolutionChain: evolutionChain ?? this.evolutionChain,
      region: region ?? this.region,
    );
  }

  /// Get the primary type (first type in the list)
  String get primaryType => types.isNotEmpty ? types.first : 'normal';

  /// Get the secondary type (second type in the list if exists)
  String? get secondaryType => types.length > 1 ? types[1] : null;

  /// Get formatted number with leading zeros
  String get formattedNumber {
    final num = int.tryParse(number) ?? 0;
    return '#${num.toString().padLeft(3, '0')}';
  }

  /// Get formatted height in meters
  String get formattedHeight => '${height.toStringAsFixed(1)} m';

  /// Get formatted weight in kilograms
  String get formattedWeight => '${weight.toStringAsFixed(1)} kg';

  /// Get total stats value
  int get totalStats => stats.values.fold(0, (sum, value) => sum + value);

  /// Get HP stat
  int get hp => stats['hp'] ?? 0;

  /// Get Attack stat
  int get attack => stats['attack'] ?? 0;

  /// Get Defense stat
  int get defense => stats['defense'] ?? 0;

  /// Get Special Attack stat
  int get specialAttack => stats['special-attack'] ?? 0;

  /// Get Special Defense stat
  int get specialDefense => stats['special-defense'] ?? 0;

  /// Get Speed stat
  int get speed => stats['speed'] ?? 0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is Pokemon &&
      other.id == id &&
      other.name == name &&
      other.number == number;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ number.hashCode;

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, number: $number, types: $types)';
  }
}

/// Pokemon type enumeration for better type safety
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

/// Extension for PokemonType enum
extension PokemonTypeExtension on PokemonType {
  String get name {
    switch (this) {
      case PokemonType.normal:
        return 'normal';
      case PokemonType.fire:
        return 'fire';
      case PokemonType.water:
        return 'water';
      case PokemonType.electric:
        return 'electric';
      case PokemonType.grass:
        return 'grass';
      case PokemonType.ice:
        return 'ice';
      case PokemonType.fighting:
        return 'fighting';
      case PokemonType.poison:
        return 'poison';
      case PokemonType.ground:
        return 'ground';
      case PokemonType.flying:
        return 'flying';
      case PokemonType.psychic:
        return 'psychic';
      case PokemonType.bug:
        return 'bug';
      case PokemonType.rock:
        return 'rock';
      case PokemonType.ghost:
        return 'ghost';
      case PokemonType.dragon:
        return 'dragon';
      case PokemonType.dark:
        return 'dark';
      case PokemonType.steel:
        return 'steel';
      case PokemonType.fairy:
        return 'fairy';
    }
  }

  String get displayName {
    return name[0].toUpperCase() + name.substring(1);
  }

  static PokemonType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'normal':
        return PokemonType.normal;
      case 'fire':
        return PokemonType.fire;
      case 'water':
        return PokemonType.water;
      case 'electric':
        return PokemonType.electric;
      case 'grass':
        return PokemonType.grass;
      case 'ice':
        return PokemonType.ice;
      case 'fighting':
        return PokemonType.fighting;
      case 'poison':
        return PokemonType.poison;
      case 'ground':
        return PokemonType.ground;
      case 'flying':
        return PokemonType.flying;
      case 'psychic':
        return PokemonType.psychic;
      case 'bug':
        return PokemonType.bug;
      case 'rock':
        return PokemonType.rock;
      case 'ghost':
        return PokemonType.ghost;
      case 'dragon':
        return PokemonType.dragon;
      case 'dark':
        return PokemonType.dark;
      case 'steel':
        return PokemonType.steel;
      case 'fairy':
        return PokemonType.fairy;
      default:
        return PokemonType.normal;
    }
  }
}