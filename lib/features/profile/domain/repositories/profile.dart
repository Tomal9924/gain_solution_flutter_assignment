import '../../../../core/shared/shared.dart';

abstract class ProfileRepository {
  FutureOr<Either<Failure, void>> find();
}
