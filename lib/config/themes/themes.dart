import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1b6b51),
      surfaceTint: Color(0xff1b6b51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa6f2d1),
      onPrimaryContainer: Color(0xff002116),
      secondary: Color(0xff2e628c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffcee5ff),
      onSecondaryContainer: Color(0xff001d32),
      tertiary: Color(0xff7c580d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdeab),
      onTertiaryContainer: Color(0xff281900),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff5fbf5),
      onSurface: Color(0xff171d1a),
      onSurfaceVariant: Color(0xff404944),
      outline: Color(0xff707974),
      outlineVariant: Color(0xffbfc9c2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322e),
      inversePrimary: Color(0xff8bd6b6),
      primaryFixed: Color(0xffa6f2d1),
      onPrimaryFixed: Color(0xff002116),
      primaryFixedDim: Color(0xff8bd6b6),
      onPrimaryFixedVariant: Color(0xff00513b),
      secondaryFixed: Color(0xffcee5ff),
      onSecondaryFixed: Color(0xff001d32),
      secondaryFixedDim: Color(0xff9bcbfa),
      onSecondaryFixedVariant: Color(0xff0d4a73),
      tertiaryFixed: Color(0xffffdeab),
      onTertiaryFixed: Color(0xff281900),
      tertiaryFixedDim: Color(0xffefbf6d),
      onTertiaryFixedVariant: Color(0xff5f4100),
      surfaceDim: Color(0xffd6dbd6),
      surfaceBright: Color(0xfff5fbf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f0),
      surfaceContainer: Color(0xffe9efea),
      surfaceContainerHigh: Color(0xffe4eae4),
      surfaceContainerHighest: Color(0xffdee4df),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004d38),
      surfaceTint: Color(0xff1b6b51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff378166),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff04466e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4779a4),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5a3d00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff956e24),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fbf5),
      onSurface: Color(0xff171d1a),
      onSurfaceVariant: Color(0xff3c4540),
      outline: Color(0xff58615c),
      outlineVariant: Color(0xff737d77),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322e),
      inversePrimary: Color(0xff8bd6b6),
      primaryFixed: Color(0xff378166),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff17684f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4779a4),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2b6089),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff956e24),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff79550a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dbd6),
      surfaceBright: Color(0xfff5fbf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f0),
      surfaceContainer: Color(0xffe9efea),
      surfaceContainerHigh: Color(0xffe4eae4),
      surfaceContainerHighest: Color(0xffdee4df),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00281c),
      surfaceTint: Color(0xff1b6b51),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004d38),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00243d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff04466e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff301f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5a3d00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fbf5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1d2622),
      outline: Color(0xff3c4540),
      outlineVariant: Color(0xff3c4540),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c322e),
      inversePrimary: Color(0xffb0fcdb),
      primaryFixed: Color(0xff004d38),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003425),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff04466e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff002f4d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5a3d00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3e2900),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd6dbd6),
      surfaceBright: Color(0xfff5fbf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f0),
      surfaceContainer: Color(0xffe9efea),
      surfaceContainerHigh: Color(0xffe4eae4),
      surfaceContainerHighest: Color(0xffdee4df),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8bd6b6),
      surfaceTint: Color(0xff8bd6b6),
      onPrimary: Color(0xff003828),
      primaryContainer: Color(0xff00513b),
      onPrimaryContainer: Color(0xffa6f2d1),
      secondary: Color(0xff9bcbfa),
      onSecondary: Color(0xff003353),
      secondaryContainer: Color(0xff0d4a73),
      onSecondaryContainer: Color(0xffcee5ff),
      tertiary: Color(0xffefbf6d),
      onTertiary: Color(0xff422c00),
      tertiaryContainer: Color(0xff5f4100),
      onTertiaryContainer: Color(0xffffdeab),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1512),
      onSurface: Color(0xffdee4df),
      onSurfaceVariant: Color(0xffbfc9c2),
      outline: Color(0xff89938d),
      outlineVariant: Color(0xff404944),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4df),
      inversePrimary: Color(0xff1b6b51),
      primaryFixed: Color(0xffa6f2d1),
      onPrimaryFixed: Color(0xff002116),
      primaryFixedDim: Color(0xff8bd6b6),
      onPrimaryFixedVariant: Color(0xff00513b),
      secondaryFixed: Color(0xffcee5ff),
      onSecondaryFixed: Color(0xff001d32),
      secondaryFixedDim: Color(0xff9bcbfa),
      onSecondaryFixedVariant: Color(0xff0d4a73),
      tertiaryFixed: Color(0xffffdeab),
      onTertiaryFixed: Color(0xff281900),
      tertiaryFixedDim: Color(0xffefbf6d),
      onTertiaryFixedVariant: Color(0xff5f4100),
      surfaceDim: Color(0xff0f1512),
      surfaceBright: Color(0xff343b37),
      surfaceContainerLowest: Color(0xff0a0f0d),
      surfaceContainerLow: Color(0xff171d1a),
      surfaceContainer: Color(0xff1b211e),
      surfaceContainerHigh: Color(0xff252b28),
      surfaceContainerHighest: Color(0xff303633),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8fdaba),
      surfaceTint: Color(0xff8bd6b6),
      onPrimary: Color(0xff001b11),
      primaryContainer: Color(0xff559e82),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff9fd0ff),
      onSecondary: Color(0xff00182a),
      secondaryContainer: Color(0xff6495c1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff4c371),
      onTertiary: Color(0xff211400),
      tertiaryContainer: Color(0xffb48a3d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1512),
      onSurface: Color(0xfff6fcf7),
      onSurfaceVariant: Color(0xffc3cdc6),
      outline: Color(0xff9ca59f),
      outlineVariant: Color(0xff7c8580),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4df),
      inversePrimary: Color(0xff00533c),
      primaryFixed: Color(0xffa6f2d1),
      onPrimaryFixed: Color(0xff00150d),
      primaryFixedDim: Color(0xff8bd6b6),
      onPrimaryFixedVariant: Color(0xff003f2d),
      secondaryFixed: Color(0xffcee5ff),
      onSecondaryFixed: Color(0xff001222),
      secondaryFixedDim: Color(0xff9bcbfa),
      onSecondaryFixedVariant: Color(0xff00395c),
      tertiaryFixed: Color(0xffffdeab),
      onTertiaryFixed: Color(0xff1a0f00),
      tertiaryFixedDim: Color(0xffefbf6d),
      onTertiaryFixedVariant: Color(0xff4a3200),
      surfaceDim: Color(0xff0f1512),
      surfaceBright: Color(0xff343b37),
      surfaceContainerLowest: Color(0xff0a0f0d),
      surfaceContainerLow: Color(0xff171d1a),
      surfaceContainer: Color(0xff1b211e),
      surfaceContainerHigh: Color(0xff252b28),
      surfaceContainerHighest: Color(0xff303633),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffedfff4),
      surfaceTint: Color(0xff8bd6b6),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8fdaba),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffafaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff9fd0ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff4c371),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1512),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff3fdf6),
      outline: Color(0xffc3cdc6),
      outlineVariant: Color(0xffc3cdc6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4df),
      inversePrimary: Color(0xff003122),
      primaryFixed: Color(0xffaaf7d6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff8fdaba),
      onPrimaryFixedVariant: Color(0xff001b11),
      secondaryFixed: Color(0xffd6e9ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff9fd0ff),
      onSecondaryFixedVariant: Color(0xff00182a),
      tertiaryFixed: Color(0xffffe3ba),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff4c371),
      onTertiaryFixedVariant: Color(0xff211400),
      surfaceDim: Color(0xff0f1512),
      surfaceBright: Color(0xff343b37),
      surfaceContainerLowest: Color(0xff0a0f0d),
      surfaceContainerLow: Color(0xff171d1a),
      surfaceContainer: Color(0xff1b211e),
      surfaceContainerHigh: Color(0xff252b28),
      surfaceContainerHighest: Color(0xff303633),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
