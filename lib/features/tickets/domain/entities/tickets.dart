import '../../../../core/shared/shared.dart';

class TicketsEntity extends Equatable {
  // TODO: implement entity properties
  final Identity identity;

  TicketsEntity({
    required this.identity,
  });

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        identity,
      ];
}
