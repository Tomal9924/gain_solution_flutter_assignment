import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class TicketsLocalDataSourceImpl extends TicketsLocalDataSource {
  final Map<String, TicketsEntity> _cache = {};

  @override
  FutureOr<void> add({
    required Identity identity,
    required TicketsEntity tickets,
  }) {
    _cache[identity.guid] = tickets;
  }

  @override
  FutureOr<void> update({
    required Identity identity,
    required TicketsEntity tickets,
  }) {
    _cache[identity.guid] = tickets;
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
  FutureOr<TicketsEntity> find({
    required Identity identity,
  }) {
    final item = _cache[identity.guid];
    if (item == null) {
      throw TicketsNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
