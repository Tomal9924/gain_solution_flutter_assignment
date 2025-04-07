import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FindFilterUseCase {
  final FilterRepository repository;

  FindFilterUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call() async {
    return await repository.find();
  }
}
