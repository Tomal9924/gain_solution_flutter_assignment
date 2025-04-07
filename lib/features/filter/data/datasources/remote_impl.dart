import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FilterRemoteDataSourceImpl extends FilterRemoteDataSource {
  final Client client;

  FilterRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> find() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> findAll() async {
    throw UnimplementedError();
  }
}
