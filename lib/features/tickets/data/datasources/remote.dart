import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

abstract class TicketsRemoteDataSource {
  FutureOr<void> findAll();

  FutureOr<void> refresh();
}
