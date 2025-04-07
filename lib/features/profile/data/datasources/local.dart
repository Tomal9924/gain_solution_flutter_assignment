import '../../../../core/shared/shared.dart';
import '../../profile.dart';

abstract class ProfileLocalDataSource {
  FutureOr<void> add({
    required Identity identity,
    required ProfileEntity profile,
  });

  FutureOr<void> update({
    required Identity identity,
    required ProfileEntity profile,
  });

  FutureOr<void> remove({
    required Identity identity,
  });

  FutureOr<void> removeAll();

  FutureOr<ProfileEntity> find({
    required Identity identity,
  });
}
