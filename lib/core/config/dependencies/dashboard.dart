part of '../config.dart';

Future<void> get dashboardDependencies async {
  //! ----------------- Bloc -----------------

  //! ----------------- UseCase -----------------

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(network: sl()),
  );

  //! ----------------- Data sources -----------------
}
