import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

abstract class TicketsRemoteDataSource {
  FutureOr<List<TicketsModel>> findAll();

  FutureOr<void> refresh();
}
