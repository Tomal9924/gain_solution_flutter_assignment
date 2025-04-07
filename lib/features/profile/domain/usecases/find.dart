import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class FindProfileUseCase {
  final ProfileRepository repository;

  FindProfileUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call() async {
    return await repository.find();
  }
}
