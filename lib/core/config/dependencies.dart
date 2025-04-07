part of 'config.dart';

final sl = GetIt.instance;

Future<void> _setupDependencies() async {
  await _core;

  await Future.wait([
    //! mason:linking-dependencies - DO NOT REMOVE THIS COMMENT --------------------------->
    profileDependencies,
    contactsDependencies,
    dashboardDependencies,
    ticketsDependencies,
  ]);
}

Future<void> get _core async {
  sl.registerFactory(() => ThemeBloc());

  sl.registerLazySingleton(() => Client());

  sl.registerLazySingleton(
    () => InternetConnectionChecker.createInstance(
      addresses: sl(),
      statusController: sl(),
      slowConnectionConfig: const SlowConnectionConfig(
        enableToCheckForSlowConnection: true,
        slowConnectionThreshold: Duration(seconds: 1),
      ),
    ),
  );
  sl.registerLazySingleton(
    () => List<AddressCheckOption>.unmodifiable(<AddressCheckOption>[
      AddressCheckOption(uri: Uri.parse('https://google.com')),
    ]),
  );
  sl.registerLazySingleton<StreamController<InternetConnectionStatus>>(
    () => StreamController<InternetConnectionStatus>.broadcast(),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: sl()),
  );
}
