import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

abstract class TicketsLocalDataSource {
  FutureOr<void> add({
    required Identity identity,
    required TicketsEntity tickets,
  });

  FutureOr<void> update({
    required Identity identity,
    required TicketsEntity tickets,
  });

  FutureOr<void> remove({
    required Identity identity,
  });

  FutureOr<void> removeAll();

  FutureOr<TicketsEntity> find({
    required Identity identity,
  });
}
