import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

class FindContactsUseCase {
  final ContactsRepository repository;

  FindContactsUseCase({
    required this.repository,
  });

  FutureOr<Either<Failure, void>> call() async {
    return await repository.find();
  }
}
