import '../../../../core/shared/shared.dart';

abstract class ProfileRemoteDataSource {
  FutureOr<void> find();
}
