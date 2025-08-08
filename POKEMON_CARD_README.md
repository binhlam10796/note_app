# Pokémon Card Component Implementation

## Design Description

This implementation creates a beautiful, modern Pokémon Card component following the Figma design specifications. The card features:

- **Clean Modern Design**: Rounded corners, subtle shadows, and elegant spacing
- **Type-Based Color Theming**: Each card adapts its colors based on the Pokémon's primary type
- **Interactive States**: Hover and press animations for enhanced user experience
- **Responsive Layout**: Flexible sizing with support for grid layouts
- **Accessible Typography**: Clear hierarchy with the Poppins font family

### Key Visual Elements

- **Pokémon Image**: Positioned in the top-right corner with fallback placeholder
- **Type Badges**: Color-coded chips displaying Pokémon types
- **Background Gradient**: Subtle gradient overlay matching the primary type color
- **Pokéball Decoration**: Subtle background element for visual interest
- **Card Elevation**: Multi-layered shadows for depth and interactivity

## Code Implementation

### A. Style Guide Implementation

#### `AppColors` (`lib/constants/app_colors.dart`)
Contains comprehensive color definitions including:
- Primary brand colors
- Pokemon type-specific colors (18 types supported)
- UI state colors (text, backgrounds, borders)
- System colors (success, warning, error, info)
- Dynamic color getter: `AppColors.getTypeColor(String type)`

#### `AppTypography` (`lib/constants/app_typography.dart`)
Defines text styles using the Poppins font family:
- Heading styles (H1-H4)
- Body text variations
- Pokemon-specific styles (name, number, type badges)
- Button and label styles
- Proper line heights and font weights

#### `AppElevations` (`lib/constants/app_elevations.dart`)
Provides shadow and elevation constants:
- Card elevation states (normal, hover, pressed)
- Pokemon card specific shadows
- Button and modal elevations
- Type badge shadows

### B. Pokemon Data Model (`lib/models/pokemon.dart`)

The `Pokemon` class includes:
- Core properties: `id`, `name`, `number`, `types`, `imageUrl`
- Optional properties: `description`, `abilities`, `height`, `weight`
- Utility methods: `primaryType`, `formattedNumber`, `capitalizedName`
- JSON serialization support
- Immutable design with `copyWith` method

### C. Primary Task: PokemonCard Widget (`lib/widgets/pokemon_card.dart`)

#### `PokemonCard` Widget Features:
- **Stateful Design**: Handles hover and press interactions
- **Customizable Sizing**: Optional width and height parameters
- **Type-Based Theming**: Automatically adapts colors based on Pokemon type
- **Image Handling**: Network images with fallback placeholders
- **Interactive States**: Smooth animations for user feedback
- **Accessibility**: Proper tap targets and visual hierarchy

#### `PokemonCardGrid` Widget:
- Grid layout for displaying multiple cards
- Configurable columns and aspect ratio
- Built-in spacing and padding
- Tap handling with callback support

## Asset Handling

The implementation assumes SVG assets are available in `assets/svgs/` as specified in the requirements:
- `pokeball.svg`: Used for decorative background element
- `pokemon_placeholder.svg`: Fallback for missing Pokemon images

Assets are referenced using `flutter_gen` format: `Assets.svgs.assetName.svg()`

## Usage Examples

### Single Pokemon Card
```dart
PokemonCard(
  pokemon: Pokemon(
    id: 25,
    name: 'pikachu',
    number: '025',
    types: ['electric'],
    imageUrl: 'https://example.com/pikachu.png',
  ),
  onTap: () => print('Pikachu tapped!'),
  width: 160,
  height: 220,
)
```

### Pokemon Card Grid
```dart
PokemonCardGrid(
  pokemonList: pokemonList,
  onPokemonTap: (pokemon) => navigateToDetail(pokemon),
  crossAxisCount: 2,
  childAspectRatio: 0.75,
)
```

## Demo Implementation

The `PokemonCardDemo` and `SinglePokemonCardDemo` widgets (`lib/widgets/pokemon_card_demo.dart`) provide:
- Sample Pokemon data for testing
- Grid layout demonstration
- Interactive feedback with SnackBars
- Different card sizing examples

## File Structure

```
lib/
├── constants/
│   ├── app_colors.dart
│   ├── app_typography.dart
│   └── app_elevations.dart
├── models/
│   └── pokemon.dart
├── widgets/
│   ├── pokemon_card.dart
│   └── pokemon_card_demo.dart
└── gen/
    └── assets.gen.dart (generated)

assets/
└── svgs/
    ├── pokeball.svg
    └── pokemon_placeholder.svg
```

## Dependencies Required

- `flutter/material.dart`: Core Flutter framework
- `flutter_svg: ^2.0.7`: SVG asset support
- `flutter_gen: ^5.3.2`: Asset code generation

## Naming and Formatting

- **Classes**: PascalCase (`PokemonCard`, `AppColors`)
- **Variables**: camelCase (`pokemonData`, `primaryType`)
- **Constants**: camelCase with static modifier
- **Files**: snake_case (`pokemon_card.dart`)

The implementation follows standard Dart formatting and Flutter best practices throughout.