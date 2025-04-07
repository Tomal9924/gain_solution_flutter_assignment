import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

class ContactsLocalDataSourceImpl extends ContactsLocalDataSource {
  final Map<String, ContactsEntity> _cache = {};

  @override
  FutureOr<void> add({
    required Identity identity,
    required ContactsEntity contacts,
  }) {
    _cache[identity.guid] = contacts;
  }

  @override
  FutureOr<void> update({
    required Identity identity,
    required ContactsEntity contacts,
  }) {
    _cache[identity.guid] = contacts;
  }

  @override
  FutureOr<void> remove({
    required Identity identity,
  }) {
    _cache.remove(identity.guid);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<ContactsEntity> find({
    required Identity identity,
  }) {
    final item = _cache[identity.guid];
    if (item == null) {
      throw ContactsNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
