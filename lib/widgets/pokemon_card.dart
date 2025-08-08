import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../constants/app_typography.dart';
import '../constants/app_elevations.dart';
import '../models/pokemon.dart';
import '../gen/assets.gen.dart';

/// A reusable Pokemon Card widget that displays Pokemon information
/// following the Figma design specifications
class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  const PokemonCard({
    Key? key,
    required this.pokemon,
    this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final primaryTypeColor = AppColors.getTypeColor(widget.pokemon.primaryType);
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.width ?? 160,
          height: widget.height ?? 220,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.cardBorder,
              width: 1,
            ),
            boxShadow: _isPressed
                ? AppElevations.cardPressedShadow
                : _isHovered
                    ? AppElevations.pokemonCardHoverShadow
                    : AppElevations.pokemonCardShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Background gradient based on primary type
                _buildBackgroundGradient(primaryTypeColor),
                
                // Pokemon image
                _buildPokemonImage(),
                
                // Card content
                _buildCardContent(),
                
                // Pokeball background decoration
                _buildPokeballDecoration(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundGradient(Color primaryColor) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.1),
              primaryColor.withOpacity(0.05),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    return Positioned(
      top: 20,
      right: 8,
      child: SizedBox(
        width: 80,
        height: 80,
        child: widget.pokemon.imageUrl.isNotEmpty
            ? Image.network(
                widget.pokemon.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderImage();
                },
              )
            : _buildPlaceholderImage(),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.getTypeColor(widget.pokemon.primaryType).withOpacity(0.1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: const Icon(
        Icons.catching_pokemon,
        size: 40,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildCardContent() {
    return Positioned(
      left: 16,
      top: 16,
      right: 16,
      bottom: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pokemon number
          Text(
            widget.pokemon.formattedNumber,
            style: AppTypography.pokemonNumber,
          ),
          
          const SizedBox(height: 4),
          
          // Pokemon name
          SizedBox(
            width: 80, // Constrain width to prevent overlap with image
            child: Text(
              widget.pokemon.capitalizedName,
              style: AppTypography.pokemonName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          const Spacer(),
          
          // Pokemon types
          _buildTypeBadges(),
        ],
      ),
    );
  }

  Widget _buildTypeBadges() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.pokemon.types.take(2).map((type) {
        return Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.getTypeColor(type),
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppElevations.typeBadgeShadow,
          ),
          child: Text(
            type.toUpperCase(),
            style: AppTypography.pokemonType,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPokeballDecoration() {
    return Positioned(
      top: -10,
      right: -10,
      child: Opacity(
        opacity: 0.1,
        child: Transform.rotate(
          angle: 0.2,
          child: SizedBox(
            width: 60,
            height: 60,
            child: SvgPicture.asset(
              'assets/svgs/pokeball.svg',
              colorFilter: ColorFilter.mode(
                AppColors.getTypeColor(widget.pokemon.primaryType),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A widget for displaying Pokemon cards in a grid layout
class PokemonCardGrid extends StatelessWidget {
  final List<Pokemon> pokemonList;
  final Function(Pokemon)? onPokemonTap;
  final int crossAxisCount;
  final double childAspectRatio;
  final EdgeInsets padding;

  const PokemonCardGrid({
    Key? key,
    required this.pokemonList,
    this.onPokemonTap,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.75,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return PokemonCard(
            pokemon: pokemon,
            onTap: onPokemonTap != null
                ? () => onPokemonTap!(pokemon)
                : null,
          );
        },
      ),
    );
  }
}