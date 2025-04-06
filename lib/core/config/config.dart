import '../shared/shared.dart';
//! mason:linking-imports - DO NOT REMOVE THIS COMMENT --------------------------->

part 'dependencies.dart';
part 'network_certificates.dart';
//! mason:linking-dependencies - DO NOT REMOVE THIS COMMENT ---------------------->

class AppConfig {
  static FutureOr<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // Bypass the SSL certificate verification
    HttpOverrides.global = MyHttpOverrides();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationCacheDirectory(),
    );

    // Initialize the configurations
    await _setupDependencies();
  }

  static ThemeData theme({
    required BuildContext context,
    required ThemeScheme theme,
  }) =>
      ThemeData(
        brightness: Brightness.dark,
        canvasColor: theme.backgroundPrimary,
        scaffoldBackgroundColor: theme.backgroundPrimary,
        splashFactory: InkRipple.splashFactory,
        primaryColor: theme.primary,
        indicatorColor: theme.primary,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: theme.backgroundSecondary,
          labelStyle:
              TextStyles.body(context: context, color: theme.textPrimary),
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: .5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: theme.negative, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: theme.negative, width: 3),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 1,
            padding: const EdgeInsets.all(16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            elevation: 3,
            backgroundColor: Colors.white,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: theme.textPrimary),
        iconTheme: IconThemeData(color: theme.textPrimary, size: 20),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: theme.textPrimary),
          titleSpacing: 0,
          actionsIconTheme: IconThemeData(color: theme.textPrimary),
          backgroundColor: theme.backgroundSecondary,
          surfaceTintColor: theme.backgroundSecondary,
          foregroundColor: theme.backgroundPrimary,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: theme.backgroundPrimary,
          primary: theme.primary,
          brightness: Brightness.dark,
        ),
      );
}
