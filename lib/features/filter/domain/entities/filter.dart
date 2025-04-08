import 'package:gain_solutions_flutter_assignment/features/filter/domain/entities/tag.dart';

import '../../../../core/shared/shared.dart';

class FilterEntity extends Equatable {
  final String id;
  final String label;
  final String type;
  final bool enabled;
  final List<TagOption> options;

  const FilterEntity({
    required this.id,
    required this.label,
    required this.type,
    required this.enabled,
    required this.options,
  });

  @override
  List<Object?> get props => [
        id,
        label,
        type,
        enabled,
        options,
      ];
}
