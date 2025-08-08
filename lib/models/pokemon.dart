class Pokemon {
  final String id;
  final String name;
  final String number;
  final List<String> types;
  final String imageUrl;
  final String? description;
  final double? height;
  final double? weight;
  final List<String>? abilities;

  const Pokemon({
    required this.id,
    required this.name,
    required this.number,
    required this.types,
    required this.imageUrl,
    this.description,
    this.height,
    this.weight,
    this.abilities,
  });

  /// Get the primary type (first type in the list)
  String get primaryType => types.isNotEmpty ? types.first : 'normal';

  /// Get formatted number with leading zeros (e.g., "001", "025")
  String get formattedNumber => number.padLeft(3, '0');

  /// Check if Pokemon has multiple types
  bool get hasMultipleTypes => types.length > 1;

  /// Get secondary type (if exists)
  String? get secondaryType => types.length > 1 ? types[1] : null;

  /// Create a copy of this Pokemon with updated fields
  Pokemon copyWith({
    String? id,
    String? name,
    String? number,
    List<String>? types,
    String? imageUrl,
    String? description,
    double? height,
    double? weight,
    List<String>? abilities,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      types: types ?? this.types,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      abilities: abilities ?? this.abilities,
    );
  }

  /// Create Pokemon from JSON
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as String,
      name: json['name'] as String,
      number: json['number'] as String,
      types: List<String>.from(json['types'] as List),
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
      height: json['height']?.toDouble(),
      weight: json['weight']?.toDouble(),
      abilities: json['abilities'] != null 
          ? List<String>.from(json['abilities'] as List)
          : null,
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
      'height': height,
      'weight': weight,
      'abilities': abilities,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is Pokemon &&
        other.id == id &&
        other.name == name &&
        other.number == number &&
        _listEquals(other.types, types) &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.height == height &&
        other.weight == weight &&
        _listEquals(other.abilities, abilities);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        number.hashCode ^
        types.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        abilities.hashCode;
  }

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, number: $number, types: $types, imageUrl: $imageUrl)';
  }

  /// Helper method to compare lists
  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (int index = 0; index < a.length; index += 1) {
      if (a[index] != b[index]) return false;
    }
    return true;
  }
}

// Sample Pokemon data for testing
class SamplePokemonData {
  static const List<Pokemon> samplePokemons = [
    Pokemon(
      id: '1',
      name: 'Bulbasaur',
      number: '001',
      types: ['grass', 'poison'],
      imageUrl: 'assets/svgs/bulbasaur.svg',
      description: 'A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.',
      height: 0.7,
      weight: 6.9,
      abilities: ['Overgrow', 'Chlorophyll'],
    ),
    Pokemon(
      id: '25',
      name: 'Pikachu',
      number: '025',
      types: ['electric'],
      imageUrl: 'assets/svgs/pikachu.svg',
      description: 'When several of these Pokémon gather, their electricity could build and cause lightning storms.',
      height: 0.4,
      weight: 6.0,
      abilities: ['Static', 'Lightning Rod'],
    ),
    Pokemon(
      id: '6',
      name: 'Charizard',
      number: '006',
      types: ['fire', 'flying'],
      imageUrl: 'assets/svgs/charizard.svg',
      description: 'Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.',
      height: 1.7,
      weight: 90.5,
      abilities: ['Blaze', 'Solar Power'],
    ),
    Pokemon(
      id: '9',
      name: 'Blastoise',
      number: '009',
      types: ['water'],
      imageUrl: 'assets/svgs/blastoise.svg',
      description: 'A brutal Pokémon with pressurized water jets on its shell. They are used for high speed tackles.',
      height: 1.6,
      weight: 85.5,
      abilities: ['Torrent', 'Rain Dish'],
    ),
  ];
}