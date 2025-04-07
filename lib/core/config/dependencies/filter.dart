part of '../config.dart';

Future<void> get filterDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerFactory(
    () => FindFilterBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FindAllFilterBloc(
      useCase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------
  sl.registerFactory(
    () => FindFilterUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => FindAllFilterUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<FilterRepository>(
    () => FilterRepositoryImpl(
      network: sl(),
      remote: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<FilterRemoteDataSource>(
    () => FilterRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
