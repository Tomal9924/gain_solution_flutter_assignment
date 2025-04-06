import 'package:flutter/material.dart';
import 'package:gain_solutions_flutter_assignment/features/tickets/tickets.dart';

class TicketCard extends StatelessWidget {
  final TicketsEntity ticket;

  const TicketCard({required this.ticket, super.key});

  @override
  Widget build(BuildContext context) {
    Color priorityColor =
        ticket.priority == 'Urgent' ? Colors.red : Colors.green;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ticket.id, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(
              ticket.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${ticket.assignee} • ${ticket.date}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 10, color: priorityColor),
                      const SizedBox(width: 4),
                      Text(
                        ticket.priority,
                        style: TextStyle(color: priorityColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(ticket.status),
                ),
                if (ticket.isSpam == true) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Spam',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: ticket.category == 'First response overdue'
                    ? Colors.orange.withOpacity(0.1)
                    : Colors.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                ticket.category,
                style: TextStyle(
                  color: ticket.category == 'First response overdue'
                      ? Colors.orange
                      : Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
