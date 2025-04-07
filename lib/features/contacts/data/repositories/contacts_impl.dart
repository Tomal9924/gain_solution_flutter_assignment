import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final NetworkInfo network;
  final ContactsLocalDataSource local;
  final ContactsRemoteDataSource remote;

  ContactsRepositoryImpl({
    required this.network,
    required this.local,
    required this.remote,
  });

  /*
      final result = await local.find(identity: identity);
      return Right(result);
    } on ContactsNotFoundInLocalCacheFailure catch (_) {
     */

  @override
  FutureOr<Either<Failure, List<ContactsEntity>>> findAll() async {
    try {
      if (await network.online) {
        final result = await remote.findAll();
        //await local.add(contacts: contacts);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  FutureOr<Either<Failure, void>> find() async {
    try {
      if (await network.online) {
        final result = await remote.find();
        //await local.add(contacts: contacts);

        return Right(result);
      } else {
        return Left(NoInternetFailure());
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
