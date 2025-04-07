import '../../../../core/shared/shared.dart';

class FilterEntity extends Equatable {
  // TODO: implement entity properties
  final Identity identity;

  FilterEntity({
    required this.identity,
  });

  @override
  List<Object?> get props => [
        // TODO: add entity properties
        identity,
      ];
}
