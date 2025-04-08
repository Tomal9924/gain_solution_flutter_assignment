import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

abstract class ContactsRemoteDataSource {
  FutureOr<List<ContactsModel>> findAll({
    required String? query,
  });

  FutureOr<void> find();
}
