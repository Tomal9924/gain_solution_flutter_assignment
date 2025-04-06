import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class TicketsRepositoryImpl extends TicketsRepository {
  final NetworkInfo network;
  final TicketsLocalDataSource local;
  final TicketsRemoteDataSource remote;

  TicketsRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

/*
      final result = await local.find(identity: identity);
      return Right(result);
    } on TicketsNotFoundInLocalCacheFailure catch (_) {
     */

  @override
  FutureOr<Either<Failure, void>> findAll() async {
    try {
      if (await network.online) {
        final result = await remote.findAll();
        await local.add(tickets: tickets);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> refresh() async {
    try {
      if (await network.online) {
        final result = await remote.refresh();
        await local.add(tickets: tickets);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
