import '../../../../core/shared/shared.dart';
import '../../profile.dart';

abstract class ProfileRemoteDataSource {
  FutureOr<void> find();
}
