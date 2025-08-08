/// Pokemon data model for the Pokédex application
class Pokemon {
  final int id;
  final String name;
  final String number;
  final List<String> types;
  final String imageUrl;
  final String? description;
  final List<String>? abilities;
  final double? height;
  final double? weight;

  const Pokemon({
    required this.id,
    required this.name,
    required this.number,
    required this.types,
    required this.imageUrl,
    this.description,
    this.abilities,
    this.height,
    this.weight,
  });

  /// Get the primary type (first type in the list)
  String get primaryType => types.isNotEmpty ? types.first : 'normal';

  /// Get formatted number with leading zeros (e.g., "#001")
  String get formattedNumber => '#${number.padLeft(3, '0')}';

  /// Capitalize the first letter of the Pokemon name
  String get capitalizedName => name.isNotEmpty 
      ? '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}'
      : name;

  /// Factory constructor for creating Pokemon from JSON
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      number: json['number'] as String,
      types: List<String>.from(json['types'] as List),
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
      abilities: json['abilities'] != null 
          ? List<String>.from(json['abilities'] as List)
          : null,
      height: json['height']?.toDouble(),
      weight: json['weight']?.toDouble(),
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
      'abilities': abilities,
      'height': height,
      'weight': weight,
    };
  }

  /// Create a copy of this Pokemon with some fields replaced
  Pokemon copyWith({
    int? id,
    String? name,
    String? number,
    List<String>? types,
    String? imageUrl,
    String? description,
    List<String>? abilities,
    double? height,
    double? weight,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      types: types ?? this.types,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      abilities: abilities ?? this.abilities,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pokemon && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Pokemon(id: $id, name: $name, number: $number, types: $types)';
  }
}