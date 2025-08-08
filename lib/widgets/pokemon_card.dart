import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../theme/app_elevations.dart';
import '../gen/assets.gen.dart';

/// PokemonCard widget for displaying Pokemon information
/// Based on the Figma design specifications from the Pokemon Card component
class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool showStats;
  final bool isCompact;

  const PokemonCard({
    Key? key,
    required this.pokemon,
    this.onTap,
    this.width,
    this.height,
    this.showStats = false,
    this.isCompact = false,
  }) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
    
    if (isHovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryType = widget.pokemon.primaryType;
    final typeColors = AppColors.getTypeGradient(primaryType);
    final typeShadow = AppElevations.getTypeShadow(primaryType);
    
    return MouseRegion(
      onEnter: (_) => _handleHover(true),
      onExit: (_) => _handleHover(false),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                width: widget.width ?? (widget.isCompact ? 160 : 200),
                height: widget.height ?? (widget.isCompact ? 220 : 280),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: _isHovered
                      ? AppElevations.getTypeHoverShadow(primaryType)
                      : typeShadow,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: typeColors,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Background Pattern
                        _buildBackgroundPattern(),
                        
                        // Card Content
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header with number and pokeball
                              _buildCardHeader(),
                              
                              const SizedBox(height: 8),
                              
                              // Pokemon name
                              _buildPokemonName(),
                              
                              const SizedBox(height: 4),
                              
                              // Pokemon types
                              _buildPokemonTypes(),
                              
                              const Spacer(),
                              
                              // Pokemon image
                              _buildPokemonImage(),
                              
                              if (widget.showStats && !widget.isCompact) ...[
                                const SizedBox(height: 12),
                                _buildPokemonStats(),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackgroundPattern() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0.8, -0.8),
            radius: 1.5,
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.transparent,
            ],
          ),
        ),
        child: CustomPaint(
          painter: _PokemonCardPatternPainter(),
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.pokemon.formattedNumber,
          style: AppTypography.pokemonNumber.copyWith(
            color: AppColors.textLight.withOpacity(0.8),
            fontWeight: FontWeight.w700,
          ),
        ),
        Assets.svgs.pokeball.svg(
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            AppColors.textLight.withOpacity(0.3),
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }

  Widget _buildPokemonName() {
    return Text(
      widget.pokemon.name,
      style: widget.isCompact
          ? AppTypography.titleMedium.copyWith(
              color: AppColors.textLight,
              fontWeight: FontWeight.w700,
            )
          : AppTypography.pokemonName.copyWith(
              color: AppColors.textLight,
            ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPokemonTypes() {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: widget.pokemon.types
          .take(widget.isCompact ? 1 : 2)
          .map((type) => _buildTypeChip(type))
          .toList(),
    );
  }

  Widget _buildTypeChip(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.textLight.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.textLight.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        type.toUpperCase(),
        style: AppTypography.pokemonType.copyWith(
          color: AppColors.textLight,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildPokemonImage() {
    return Center(
      child: Container(
        width: widget.isCompact ? 80 : 120,
        height: widget.isCompact ? 80 : 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.textLight.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: AppColors.textPrimary.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipOval(
          child: widget.pokemon.imageUrl.isNotEmpty
              ? Image.network(
                  widget.pokemon.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildPlaceholderImage(),
                )
              : _buildPlaceholderImage(),
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.textLight.withOpacity(0.2),
      ),
      child: Icon(
        Icons.catching_pokemon,
        size: widget.isCompact ? 40 : 60,
        color: AppColors.textLight.withOpacity(0.6),
      ),
    );
  }

  Widget _buildPokemonStats() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.textLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('HP', widget.pokemon.hp),
          _buildStatItem('ATK', widget.pokemon.attack),
          _buildStatItem('DEF', widget.pokemon.defense),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, int value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTypography.labelSmall.copyWith(
            color: AppColors.textLight.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value.toString(),
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textLight,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

/// Custom painter for Pokemon card background pattern
class _PokemonCardPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Create decorative circles
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.2),
      30,
      paint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.9, size.height * 0.7),
      20,
      paint,
    );
    
    canvas.drawCircle(
      Offset(size.width * 0.1, size.height * 0.9),
      15,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}