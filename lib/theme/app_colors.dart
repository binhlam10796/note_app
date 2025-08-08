import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF3558CD);
  static const Color primaryLight = Color(0xFF6C9BD1);
  static const Color primaryDark = Color(0xFF1E3A8A);

  // Pokemon Type Colors
  static const Color grass = Color(0xFF48D0B0);
  static const Color fire = Color(0xFFFC6C6D);
  static const Color water = Color(0xFF76BDFE);
  static const Color electric = Color(0xFFFFD86F);
  static const Color psychic = Color(0xFFF993CF);
  static const Color ice = Color(0xFF7FCCEC);
  static const Color dragon = Color(0xFF7383B9);
  static const Color dark = Color(0xFF6F6E78);
  static const Color fairy = Color(0xFFFF9EB5);
  static const Color fighting = Color(0xFFEB4971);
  static const Color poison = Color(0xFFCC6AE7);
  static const Color ground = Color(0xFFF78551);
  static const Color flying = Color(0xFF83A2E3);
  static const Color bug = Color(0xFF8BD674);
  static const Color rock = Color(0xFFB69E31);
  static const Color ghost = Color(0xFF8571BE);
  static const Color steel = Color(0xFF4C91B2);
  static const Color normal = Color(0xFF9DA0AA);

  // Background Colors
  static const Color background = Color(0xFFF7F7F7);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF1D1D1D);
  static const Color textSecondary = Color(0xFF747476);
  static const Color textTertiary = Color(0xFF9F9F9F);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Utility Colors
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // Border Colors
  static const Color border = Color(0xFFE5E5E5);
  static const Color borderDark = Color(0xFFD1D5DB);

  /// Get Pokemon type color by type name
  static Color getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return grass;
      case 'fire':
        return fire;
      case 'water':
        return water;
      case 'electric':
        return electric;
      case 'psychic':
        return psychic;
      case 'ice':
        return ice;
      case 'dragon':
        return dragon;
      case 'dark':
        return dark;
      case 'fairy':
        return fairy;
      case 'fighting':
        return fighting;
      case 'poison':
        return poison;
      case 'ground':
        return ground;
      case 'flying':
        return flying;
      case 'bug':
        return bug;
      case 'rock':
        return rock;
      case 'ghost':
        return ghost;
      case 'steel':
        return steel;
      case 'normal':
      default:
        return normal;
    }
  }
}