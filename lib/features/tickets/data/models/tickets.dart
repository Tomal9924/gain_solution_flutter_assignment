import '../../../../core/shared/shared.dart';
import '../../tickets.dart';

class TicketsModel extends TicketsEntity {
  const TicketsModel({
    required super.id,
    required super.title,
    required super.assignee,
    required super.date,
    required super.priority,
    required super.status,
    required super.category,
  });

  factory TicketsModel.parse({required Map<String, dynamic> map}) {
    try {
      return TicketsModel(
        id: map['id'] as String,
        title: map['title'] as String,
        assignee: map['assigned_to'] as String,
        date: map['date'] as String,
        priority: map['priority'] as String,
        status: map['status'] as String,
        category: map['category'] as String,
      );
    } catch (e, stackTrace) {
      throw TicketsModelParseFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
