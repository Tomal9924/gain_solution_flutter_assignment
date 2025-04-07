import 'package:gain_solutions_flutter_assignment/features/tickets/tickets.dart';

import '../shared.dart';

extension TicketCategoryStatusExtension on TicketsEntity {
  Color color(String category) {
    switch (category) {
      case 'First response overdue':
        return Colors.orange;
      case 'new':
      case 'New':
        return Colors.blue;
      case 'customer responded':
      case 'Customer responded':
        return Colors.deepPurpleAccent;
      default:
        return Colors.grey;
    }
  }

  Color chipColor(String category) {
    switch (category) {
      case 'First response overdue':
        return Colors.orange.withValues(alpha: 0.15);
      case 'new':
      case 'New':
        return Colors.blue.withValues(alpha: 0.15);
      case 'customer responded':
      case 'Customer responded':
        return Colors.deepPurpleAccent.withValues(alpha: .15);
      default:
        return Colors.grey;
    }
  }
}
