import 'shared.dart';

class TextStyles {
  static TextStyle overline({
    required BuildContext context,
    required Color color,
  }) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: color),
    );
  }

  static TextStyle caption({
    required BuildContext context,
    required Color color,
  }) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: color, fontWeight: FontWeight.w600, fontSize: 10.sp),
    );
  }

  static TextStyle body({required BuildContext context, required Color color}) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  static TextStyle subTitle({
    required BuildContext context,
    required Color color,
  }) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(color: color, height: 1),
    );
  }

  static TextStyle title({
    required BuildContext context,
    required Color color,
  }) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
    );
  }

  static TextStyle miniHeadline({
    required BuildContext context,
    required Color color,
  }) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w300,
          ),
    );
  }

  static TextStyle subHeadline({
    required BuildContext context,
    required Color color,
  }) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w300,
          ),
    );
  }

  static TextStyle headline({
    required BuildContext context,
    required Color color,
  }) {
    return GoogleFonts.montserrat(
      textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w400,
          ),
    );
  }

  static TextStyle input(BuildContext context, Color color) {
    return GoogleFonts.mavenPro(
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.normal,
            height: 1,
          ),
    );
  }
}
