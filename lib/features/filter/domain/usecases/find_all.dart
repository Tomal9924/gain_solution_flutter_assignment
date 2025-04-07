import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FindAllFilterUseCase {
  final FilterRepository repository;

  FindAllFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call() async {
    return await repository.findAll();
  }
}
