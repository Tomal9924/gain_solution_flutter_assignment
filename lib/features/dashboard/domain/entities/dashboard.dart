import '../../../../core/shared/shared.dart';

class DashboardEntity extends Equatable {
  final Identity identity;

  const DashboardEntity({
    required this.identity,
  });

  @override
  List<Object?> get props => [
        identity,
      ];
}
