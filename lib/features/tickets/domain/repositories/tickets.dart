import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

abstract class TicketsRepository {
  FutureOr<Either<Failure, List<TicketsEntity>>> findAll();

  FutureOr<Either<Failure, void>> refresh();
}
