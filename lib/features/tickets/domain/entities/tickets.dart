import '../../../../core/shared/shared.dart';

class TicketsEntity extends Equatable {
  final String id;
  final String title;
  final String assignee;
  final String date;
  final String priority;
  final String status;
  final String category;
  final bool? isSpam;

  const TicketsEntity({
    required this.id,
    required this.title,
    required this.assignee,
    required this.date,
    required this.priority,
    required this.status,
    required this.category,
    this.isSpam,
  });

  @override
  List<Object?> get props => [
        title,
        assignee,
        date,
        priority,
        status,
        category,
      ];
}
