import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class FindAllTicketsUseCase {
  final TicketsRepository repository;

  FindAllTicketsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call() async {
    return await repository.findAll();
  }
}
