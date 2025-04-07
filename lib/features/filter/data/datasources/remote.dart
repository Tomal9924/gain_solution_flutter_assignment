import '../../../../core/shared/shared.dart';
import '../../filter.dart';

abstract class FilterRemoteDataSource {
  FutureOr<void> find();

  FutureOr<void> findAll();
}
