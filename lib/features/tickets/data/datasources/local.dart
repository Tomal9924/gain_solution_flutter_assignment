import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

abstract class TicketsLocalDataSource {
  FutureOr<void> add({required String id, required TicketsEntity tickets});

  FutureOr<void> update({required String id, required TicketsEntity tickets});

  FutureOr<void> remove({required String id});

  FutureOr<void> removeAll();

  FutureOr<TicketsEntity> find({required String id});
}
