import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class TicketsLocalDataSourceImpl extends TicketsLocalDataSource {
  final Map<String, TicketsEntity> _cache = {};

  @override
  FutureOr<void> add({required String id, required TicketsEntity tickets}) {
    _cache[id] = tickets;
  }

  @override
  FutureOr<void> update({required String id, required TicketsEntity tickets}) {
    _cache[id] = tickets;
  }

  @override
  FutureOr<void> remove({required String id}) {
    _cache.remove(id);
  }

  @override
  FutureOr<void> removeAll() {
    _cache.clear();
  }

  @override
  FutureOr<TicketsEntity> find({required String id}) {
    final item = _cache[id];
    if (item == null) {
      throw TicketsNotFoundInLocalCacheFailure();
    }
    return item;
  }
}
