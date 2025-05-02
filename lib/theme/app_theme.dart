import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Theme Constants
  static const double borderRadiusSm = 8.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 16.0;

  static const double paddingSm = 8.0;
  static const double paddingMd = 16.0;
  static const double paddingLg = 24.0;

  // Color Scheme
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color(0xFF6750A4), // Modern purple
    secondary: const Color(0xFF03DAC6), // Vibrant teal
    tertiary: const Color(0xFFFF8A65), // Coral accent
    surface: const Color(0xFFF8F9FB),
    background: const Color(0xFFFCFCFC),
    error: const Color(0xFFDC3545),
    surfaceVariant: const Color(0xFFE7E0EC),
  );

  // Text Theme using Google Fonts
  static final TextTheme textTheme = TextTheme(
    headlineLarge: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.5,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.inter(fontSize: 16, letterSpacing: 0.5),
    bodyMedium: GoogleFonts.inter(fontSize: 14, letterSpacing: 0.25),
    labelLarge: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
  );

  // Updated Card Theme
  static final CardTheme cardTheme = CardTheme(
    elevation: 1,
    shadowColor: lightColorScheme.shadow.withOpacity(0.1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusLg),
    ),
    margin: const EdgeInsets.symmetric(
      vertical: paddingSm,
      horizontal: paddingMd,
    ),
  );

  // Enhanced Input Decoration
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: lightColorScheme.surfaceVariant.withOpacity(0.5),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusMd),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: lightColorScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    prefixIconColor: lightColorScheme.onSurfaceVariant,
    suffixIconColor: lightColorScheme.onSurfaceVariant,
  );

  // Updated Button Themes
  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: paddingLg,
            vertical: paddingMd,
          ),
          elevation: 0,
        ),
      );

  static final FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  );

  // New Chip Theme
  static final ChipThemeData chipTheme = ChipThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusSm),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: paddingSm,
      vertical: paddingSm / 2,
    ),
    backgroundColor: lightColorScheme.surfaceVariant,
    labelStyle: textTheme.labelMedium,
  );

  // New List Tile Theme
  static final ListTileThemeData listTileTheme = ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusSm),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: paddingMd,
      vertical: paddingSm,
    ),
    tileColor: lightColorScheme.surface,
    selectedTileColor: lightColorScheme.primaryContainer,
  );

  // Complete Theme Data
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: textTheme,
    cardTheme: cardTheme,
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    filledButtonTheme: filledButtonTheme,
    chipTheme: chipTheme,
    listTileTheme: listTileTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.surface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: lightColorScheme.onSurface,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.all(
        textTheme.labelMedium?.copyWith(color: lightColorScheme.onSurface),
      ),
      backgroundColor: lightColorScheme.surface,
      elevation: 3,
      shadowColor: lightColorScheme.shadow.withOpacity(0.1),
    ),
  );
}
