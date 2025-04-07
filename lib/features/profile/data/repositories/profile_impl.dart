import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final NetworkInfo network;
  final ProfileLocalDataSource local;
  final ProfileRemoteDataSource remote;

  ProfileRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  /*
      final result = await local.find(identity: identity);
      return Right(result);
    } on ProfileNotFoundInLocalCacheFailure catch (_) {
     */

  @override
  FutureOr<Either<Failure, void>> find() async {
    try {
      if (await network.online) {
        final result = await remote.find();
        //await local.add(profile: profile);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
