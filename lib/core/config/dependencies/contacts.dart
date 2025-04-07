part of '../config.dart';

Future<void> get contactsDependencies async {
  //! ----------------- Bloc -----------------
  sl.registerFactory(
    () => FindAllContactsBloc(
      useCase: sl(),
    ),
  );
  sl.registerFactory(
    () => FindContactsBloc(
      useCase: sl(),
    ),
  );

  //! ----------------- UseCase -----------------
  sl.registerFactory(
    () => FindAllContactsUseCase(
      repository: sl(),
    ),
  );
  sl.registerFactory(
    () => FindContactsUseCase(
      repository: sl(),
    ),
  );

  //! ----------------- Repository -----------------
  sl.registerLazySingleton<ContactsRepository>(
    () => ContactsRepositoryImpl(
      network: sl(),
      remote: sl(),
      local: sl(),
    ),
  );

  //! ----------------- Data sources -----------------
  sl.registerLazySingleton<ContactsRemoteDataSource>(
    () => ContactsRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<ContactsLocalDataSource>(
    () => ContactsLocalDataSourceImpl(),
  );
}
