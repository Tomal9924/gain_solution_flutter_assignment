import 'package:gain_solutions_flutter_assignment/features/filter/domain/entities/tag.dart';

import '../../../../core/shared/shared.dart';
import '../../filter.dart';

class FilterModel extends FilterEntity {
  const FilterModel({
    required super.id,
    required super.label,
    required super.type,
    required super.enabled,
    required super.options,
  });

  factory FilterModel.parse({
    required Map<String, dynamic> map,
  }) {
    var optionsJson = map['options'] as List<dynamic>? ?? [];
    try {
      return FilterModel(
        id: map['id'],
        label: map['label'],
        type: map['type'],
        enabled: map['enabled'] ?? false,
        options: optionsJson.map((e) => TagOption.fromJson(e)).toList(),
      );
    } catch (e, stackTrace) {
      throw FilterModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
