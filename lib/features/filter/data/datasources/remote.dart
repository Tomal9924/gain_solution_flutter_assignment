import '../../../../core/shared/shared.dart';
import '../../filter.dart';

abstract class FilterRemoteDataSource {
  FutureOr<List<FilterModel>> find();

  FutureOr<void> findAll();
}
