import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

abstract class ContactsRepository {
  FutureOr<Either<Failure, List<ContactsEntity>>> findAll({
    required String? query,
  });

  FutureOr<Either<Failure, void>> find();
}
