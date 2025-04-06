import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

abstract class TicketsRepository {
  FutureOr<Either<Failure, void>> findAll();

  FutureOr<Either<Failure, void>> refresh();
}
