import '../../../../core/shared/shared.dart';

class ProfileEntity extends Equatable {
  // TODO: implement entity properties
  final Identity identity;

  const ProfileEntity({
    required this.identity,
  });

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        identity,
      ];
}
