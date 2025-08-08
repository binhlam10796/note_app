/// Pokemon data model for the card component
class Pokemon {
  final int id;
  final String name;
  final String number;
  final List<String> types;
  final String imageUrl;
  final String? description;

  const Pokemon({
    required this.id,
    required this.name,
    required this.number,
    required this.types,
    required this.imageUrl,
    this.description,
  });

  /// Get the primary type (first type in the list)
  String get primaryType => types.isNotEmpty ? types.first : 'normal';

  /// Get formatted number with leading zeros (e.g., #001)
  String get formattedNumber => '#${number.padLeft(3, '0')}';

  /// Factory constructor for creating Pokemon from JSON
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      number: json['number']?.toString() ?? '0',
      types: List<String>.from(json['types'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
      description: json['description'],
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
    };
  }

  /// Create a copy with updated values
  Pokemon copyWith({
    int? id,
    String? name,
    String? number,
    List<String>? types,
    String? imageUrl,
    String? description,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      types: types ?? this.types,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pokemon &&
        other.id == id &&
        other.name == name &&
        other.number == number &&
        other.types.length == types.length &&
        other.types.every((type) => types.contains(type)) &&
        other.imageUrl == imageUrl &&
        other.description == description;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      number,
      types,
      imageUrl,
      description,
    );
  }

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, number: $number, types: $types, imageUrl: $imageUrl, description: $description)';
  }
}

/// Sample Pokemon data for testing
class SamplePokemonData {
  static const List<Pokemon> samplePokemon = [
    Pokemon(
      id: 1,
      name: 'Bulbasaur',
      number: '001',
      types: ['grass', 'poison'],
      imageUrl: 'assets/svgs/bulbasaur.png',
      description: 'A strange seed was planted on its back at birth.',
    ),
    Pokemon(
      id: 4,
      name: 'Charmander',
      number: '004',
      types: ['fire'],
      imageUrl: 'assets/svgs/charmander.png',
      description: 'It has a preference for hot things.',
    ),
    Pokemon(
      id: 7,
      name: 'Squirtle',
      number: '007',
      types: ['water'],
      imageUrl: 'assets/svgs/squirtle.png',
      description: 'After birth, its back swells and hardens into a shell.',
    ),
    Pokemon(
      id: 25,
      name: 'Pikachu',
      number: '025',
      types: ['electric'],
      imageUrl: 'assets/svgs/pikachu.png',
      description: 'When several of these Pokémon gather, their electricity could build.',
    ),
  ];
}