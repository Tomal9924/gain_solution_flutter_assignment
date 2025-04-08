import '../../../../core/shared/shared.dart';

class DashboardEntity extends Equatable {
  // TODO: implement entity properties
  final Identity identity;

  const DashboardEntity({
    required this.identity,
  });

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        identity,
      ];
}
