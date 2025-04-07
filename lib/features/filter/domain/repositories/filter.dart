import '../../../../core/shared/shared.dart';
import '../../filter.dart';

abstract class FilterRepository {
  FutureOr<Either<Failure, void>> find();

  FutureOr<Either<Failure, void>> findAll();
}
