import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FilterRepositoryImpl extends FilterRepository {
  final NetworkInfo network;
  final FilterRemoteDataSource remote;

  FilterRepositoryImpl({
    required this.network,
    required this.remote,
  });

/*
      final result = await local.find(identity: identity);
      return Right(result);
    } on FilterNotFoundInLocalCacheFailure catch (_) {
     */

  @override
  FutureOr<Either<Failure, void>> find() async {
    try {
      if (await network.online) {
        final result = await remote.find();

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> findAll() async {
    try {
      if (await network.online) {
        final result = await remote.findAll();

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
