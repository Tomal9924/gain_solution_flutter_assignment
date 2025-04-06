part of '../config.dart';

Future<void> get ticketsDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerFactory(
    () => FindAllTicketsBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => RefreshTicketsBloc(
      useCase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------
  sl.registerFactory(
    () => FindAllTicketsUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => RefreshTicketsUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<TicketsRepository>(
    () => TicketsRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<TicketsRemoteDataSource>(
    () => TicketsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<TicketsLocalDataSource>(
    () => TicketsLocalDataSourceImpl(),
  );
}
