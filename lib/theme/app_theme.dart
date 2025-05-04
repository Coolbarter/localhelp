import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // --- Constants (Keep these as they define spacing/rounding) ---
  static const double borderRadiusSm = 8.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 20.0;
  static const double borderRadiusXl = 30.0;

  static const double paddingXs = 4.0;
  static const double paddingSm = 8.0;
  static const double paddingMd = 16.0;
  static const double paddingLg = 24.0;

  // --- NEW Green Color Scheme ---
  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    // Seed color - A sophisticated, natural Green
    seedColor: const Color(0xFF388E3C), // Material Green 700
    primary: const Color(0xFF388E3C), // Main Green
    secondary: const Color(
      0xFFFFA000,
    ), // Amber/Gold accent for contrast & warmth
    tertiary: const Color(0xFF689F38), // Lighter, earthy green (Lime Green 700)
    error: const Color(0xFFD32F2F), // Standard Red Error
    // Backgrounds & Surfaces
    background: const Color(
      0xFFF8FBF8,
    ), // Very light green/off-white background
    surface: const Color(0xFFFFFFFF), // Pure white for cards, dialogs
    surfaceVariant: const Color(0xFFE8F5E9), // Light green tint for containers
    surfaceContainerLowest: const Color(
      0xFFF1F8E9,
    ), // Slightly different light green for variety
    outline: const Color(0xFFC8E6C9), // Soft green outline
    outlineVariant: const Color(0xFFA5D6A7), // Slightly darker outline variant
    // On Colors (for text/icons)
    onPrimary: Colors.white,
    onSecondary: Colors.black, // Black text on Amber/Gold
    onTertiary: Colors.white,
    onBackground: const Color(0xFF1B1C18), // Dark Greenish-Grey text
    onSurface: const Color(0xFF1B1C18),
    onSurfaceVariant: const Color(0xFF414941), // Darker text for variants
    onError: Colors.white,
    inverseSurface: const Color(0xFF2F312C), // For Snackbars, etc.
    onInverseSurface: const Color(0xFFF0F1EB),
    primaryContainer: const Color(0xFFB9F6CA), // Light green container
    onPrimaryContainer: const Color(0xFF05210A),
    secondaryContainer: const Color(0xFFFFECB3), // Light Amber container
    onSecondaryContainer: const Color(0xFF261A00),
    tertiaryContainer: const Color(0xFFE9F5E1), // Light earthy green container
    onTertiaryContainer: const Color(0xFF151E0A),
  );

  // --- Text Theme using Poppins (Modern & Friendly) ---
  static final TextTheme textTheme = TextTheme(
    // Display Styles
    displayLarge: GoogleFonts.poppins(
      fontSize: 57,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.25,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 45,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ), // Slightly bolder display
    // Headlines
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ), // Less bold headline
    headlineSmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    // Titles
    titleLarge: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
    ), // Slightly bolder title
    titleSmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    // Body Text
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.5,
    ), // Increased line height
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.4,
    ), // Increased line height
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    // Labels (Buttons, captions, etc.)
    labelLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ), // Bolder button labels
    labelMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  ).apply(
    // Apply default text colors
    bodyColor: lightColorScheme.onSurface,
    displayColor: lightColorScheme.onSurface,
  );

  // --- Component Themes ---

  static final CardTheme cardTheme = CardTheme(
    elevation: 2, // Subtle elevation
    shadowColor: lightColorScheme.shadow.withOpacity(0.06), // Softer shadow
    color: lightColorScheme.surface, // Pure white cards
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusLg), // Use large radius
      // Optional subtle border:
      // side: BorderSide( color: lightColorScheme.outline.withOpacity(0.5), width: 1 ),
    ),
    margin: const EdgeInsets.only(
      bottom: paddingMd,
    ), // Consistent bottom margin
  );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor:
        lightColorScheme
            .surfaceContainerLowest, // Use the lighter surface color
    hintStyle: textTheme.bodyMedium?.copyWith(
      color: lightColorScheme.onSurfaceVariant.withOpacity(0.7),
    ),
    prefixIconColor: lightColorScheme.onSurfaceVariant,
    suffixIconColor: lightColorScheme.onSurfaceVariant,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: paddingMd,
      vertical: paddingMd,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadiusMd,
      ), // Medium radius for inputs
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      // Subtle border when enabled
      borderRadius: BorderRadius.circular(borderRadiusMd),
      borderSide: BorderSide(
        color: lightColorScheme.outline.withOpacity(0.5),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      // Clear focus indicator
      borderRadius: BorderRadius.circular(borderRadiusMd),
      borderSide: BorderSide(color: lightColorScheme.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusMd),
      borderSide: BorderSide(color: lightColorScheme.error, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusMd),
      borderSide: BorderSide(color: lightColorScheme.error, width: 1.5),
    ),
  );

  static final FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusXl),
      ), // Fully rounded like pills
      padding: const EdgeInsets.symmetric(
        horizontal: paddingLg,
        vertical: paddingMd,
      ),
      textStyle: textTheme.labelLarge,
      elevation: 1, // Subtle elevation
    ),
  );

  static final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: lightColorScheme.primary, // Use primary color for text
      textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusSm),
      ),
    ),
  );

  // Chip theme more aligned with interactive filter pills
  static final ChipThemeData chipTheme = ChipThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        borderRadiusLg,
      ), // Consistent rounding
      side: BorderSide(
        color: lightColorScheme.outline.withOpacity(0.5),
        width: 1,
      ), // Subtle border
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: paddingMd,
      vertical: paddingSm,
    ),
    labelStyle: textTheme.bodyMedium?.copyWith(
      color: lightColorScheme.onSurfaceVariant,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: lightColorScheme.primary, size: 18),
    backgroundColor:
        lightColorScheme.surfaceContainerLowest, // Use light background
    selectedColor:
        lightColorScheme.primaryContainer, // Use container color when selected
    secondarySelectedColor:
        lightColorScheme
            .primary, // Keep this for consistency if needed elsewhere
    checkmarkColor: lightColorScheme.primary,
    showCheckmark:
        false, // Often cleaner without checkmark for filter-style chips
  );

  static final ListTileThemeData listTileTheme = ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusMd),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: paddingMd,
      vertical: paddingXs,
    ), // Less vertical padding
    tileColor: Colors.transparent, // Let Card handle color if wrapped
    selectedTileColor: lightColorScheme.primaryContainer.withOpacity(0.5),
    iconColor:
        lightColorScheme.primary, // Primary color for leading/trailing icons
    textColor: lightColorScheme.onSurface,
    titleTextStyle: textTheme.titleMedium,
    subtitleTextStyle: textTheme.bodySmall?.copyWith(
      color: lightColorScheme.onSurfaceVariant,
    ), // Dimmer subtitle
  );

  static final DialogTheme dialogTheme = DialogTheme(
    backgroundColor: lightColorScheme.surface,
    elevation: 4, // Standard dialog elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusLg),
    ), // Consistent rounding
    titleTextStyle: textTheme.headlineSmall,
    contentTextStyle: textTheme.bodyMedium,
  );

  static final SnackBarThemeData snackBarTheme = SnackBarThemeData(
    backgroundColor: lightColorScheme.inverseSurface,
    contentTextStyle: textTheme.bodyMedium?.copyWith(
      color: lightColorScheme.onInverseSurface,
    ),
    actionTextColor:
        lightColorScheme.primaryContainer, // Action color on Snackbar
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadiusMd),
    ),
    behavior: SnackBarBehavior.floating, // Floating looks modern
    elevation: 3,
  );

  static final BottomSheetThemeData bottomSheetTheme = BottomSheetThemeData(
    backgroundColor: lightColorScheme.surface, // White background
    modalBackgroundColor: lightColorScheme.surface,
    shape: const RoundedRectangleBorder(
      // Rounded top corners
      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadiusLg)),
    ),
    elevation: 4, // Elevation for modal sheets
    modalElevation: 4,
    clipBehavior: Clip.antiAlias, // Clip content to shape
  );

  // --- Complete Theme Data Getter ---
  // Renamed to themeData as per previous correction request
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor:
          lightColorScheme.surface, // Use defined background
      cardTheme: cardTheme,
      inputDecorationTheme: inputDecorationTheme,
      filledButtonTheme: filledButtonTheme,
      textButtonTheme: textButtonTheme,
      chipTheme: chipTheme,
      listTileTheme: listTileTheme,
      dialogTheme: dialogTheme,
      snackBarTheme: snackBarTheme,
      bottomSheetTheme: bottomSheetTheme,
      appBarTheme: AppBarTheme(
        // Keep AppBar generally transparent/light unless scrolled
        backgroundColor:
            lightColorScheme.surface, // Match scaffold background
        foregroundColor:
            lightColorScheme.onSurface, // Use text color for icons/title
        elevation: 0, // Flat by default
        scrolledUnderElevation: 1, // Subtle shadow when content scrolls under
        shadowColor: lightColorScheme.shadow.withOpacity(0.1),
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ), // App bar title style
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(
          textTheme.labelSmall?.copyWith(letterSpacing: 0.4),
        ), // Adjust label style
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusMd),
        ), // Indicator shape
        indicatorColor:
            lightColorScheme
                .secondaryContainer, // Use secondary container for indicator
        backgroundColor:
            lightColorScheme.surface, // Use white surface for bottom nav bar
        elevation: 3, // Standard elevation
        shadowColor: lightColorScheme.shadow.withOpacity(0.1),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final color =
              states.contains(WidgetState.selected)
                  ? lightColorScheme
                      .onSecondaryContainer // Color for selected icon on indicator
                  : lightColorScheme
                      .onSurfaceVariant; // Color for unselected icon
          return IconThemeData(color: color, size: 24);
        }),
        labelBehavior:
            NavigationDestinationLabelBehavior.alwaysShow, // Show labels always
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor:
            lightColorScheme.secondary, // Use warm secondary accent
        foregroundColor: lightColorScheme.onSecondary, // Black text on amber
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusLg),
        ), // Consistent rounding
      ),
      // Add other component themes here if needed (e.g., TabBarTheme)
    );
  }
}
