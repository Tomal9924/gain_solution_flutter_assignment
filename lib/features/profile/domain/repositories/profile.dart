import '../../../../core/shared/shared.dart';
import '../../profile.dart';

abstract class ProfileRepository {
  FutureOr<Either<Failure, void>> find();
}
