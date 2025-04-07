import '../shared.dart';

class ThemeScheme {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTertiary;
  final Color textPrimary;
  final Color iconColor;
  final Color textSecondary;
  final Color cardColor;
  final Color positive;
  final Color positiveBackground;
  final Color positiveBackgroundTertiary;
  final Color primary;
  final Color negative;
  final Color warning;
  final Color shimmer;

  ThemeScheme({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.textPrimary,
    required this.iconColor,
    required this.cardColor,
    required this.textSecondary,
    required this.primary,
    required this.positive,
    required this.positiveBackground,
    required this.positiveBackgroundTertiary,
    required this.negative,
    required this.warning,
    required this.shimmer,
  });

  factory ThemeScheme.find({required ThemeType type}) {
    final theme = ThemeScheme(
      backgroundPrimary: Colors.white,
      backgroundSecondary: const Color(0xFFfff7d1),
      backgroundTertiary: const Color(0xFFfff3b7),
      textPrimary: const Color(0xFF2d2a32),
      iconColor: const Color(0xFF2d2a32).withValues(alpha: .5),
      textSecondary: Colors.grey,
      cardColor: Colors.grey.shade100,
      primary: const Color(0xFF4D8CFF),
      positive: const Color(0xFF3a7d44),
      positiveBackground: const Color.fromARGB(255, 236, 239, 219),
      positiveBackgroundTertiary: const Color.fromARGB(255, 203, 221, 196),
      negative: const Color(0xFFfd0054),
      warning: const Color(0xFFff8000),
      shimmer: const Color(0xFFffea83),
    );

    return theme;
  }
}
