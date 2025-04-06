import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class RefreshTicketsUseCase {
  final TicketsRepository repository;

  RefreshTicketsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call() async {
    return await repository.refresh();
  }
}
