import '../../../../core/shared/shared.dart';

class ProfileEntity extends Equatable {
  final Identity identity;

  const ProfileEntity({
    required this.identity,
  });

  @override
  List<Object?> get props => [
        identity,
      ];
}
