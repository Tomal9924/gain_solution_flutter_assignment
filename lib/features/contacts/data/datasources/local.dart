import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

abstract class ContactsLocalDataSource {
  FutureOr<void> add({
    required Identity identity,
    required ContactsEntity contacts,
  });

  FutureOr<void> update({
    required Identity identity,
    required ContactsEntity contacts,
  });

  FutureOr<void> remove({
    required Identity identity,
  });

  FutureOr<void> removeAll();

  FutureOr<ContactsEntity> find({
    required Identity identity,
  });
}
