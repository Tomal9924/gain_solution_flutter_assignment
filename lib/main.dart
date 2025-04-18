import 'core/config/config.dart';
import 'core/shared/shared.dart';

void main() async {
  await AppConfig.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeBloc>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => child!,
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, state) {
          final theme = state.scheme;
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: AppConfig.theme(context: context, theme: theme),
            darkTheme: AppConfig.theme(context: context, theme: theme),
          );
        },
      ),
    );
  }
}
