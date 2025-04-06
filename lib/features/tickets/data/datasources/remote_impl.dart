import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class TicketsRemoteDataSourceImpl extends TicketsRemoteDataSource {
  final Client client;

  TicketsRemoteDataSourceImpl({
    required this.client,
  });

  @override
  FutureOr<void> findAll() async {
    throw UnimplementedError();
  }

  @override
  FutureOr<void> refresh() async {
    throw UnimplementedError();
  }
}
