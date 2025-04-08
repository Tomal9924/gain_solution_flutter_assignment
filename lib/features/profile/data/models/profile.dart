import '../../../../core/shared/shared.dart';
import '../../profile.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.identity,
  });

  factory ProfileModel.parse({
    required Map<String, dynamic> map,
  }) {
    try {
      throw UnimplementedError();
    } catch (e, stackTrace) {
      throw ProfileModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
