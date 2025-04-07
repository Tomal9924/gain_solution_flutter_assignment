import '../../../../core/shared/shared.dart';
import '../../contacts.dart';

class FindAllContactsUseCase {
  final ContactsRepository repository;

  FindAllContactsUseCase({required this.repository});

  FutureOr<Either<Failure, List<ContactsEntity>>> call() async {
    return await repository.findAll();
  }
}
