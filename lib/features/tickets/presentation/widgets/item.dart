import 'package:gain_solutions_flutter_assignment/core/shared/extension/ticket_category_status.dart';
import 'package:gain_solutions_flutter_assignment/features/tickets/tickets.dart';

import '../../../../core/shared/shared.dart';

class TicketCard extends StatelessWidget {
  final TicketsEntity ticket;

  const TicketCard({required this.ticket, super.key});

  @override
  Widget build(BuildContext context) {
    Color priorityColor =
        ticket.priority == 'Urgent' ? Colors.red : Colors.green;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.cardColor,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: ticket.chipColor(ticket.category),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  ticket.category,
                  style: TextStyles.caption(
                    context: context,
                    color: ticket.color(ticket.category),
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "#ID ${ticket.id}",
                style: TextStyles.caption(
                  context: context,
                  color: theme.textPrimary.withValues(alpha: .5),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                ticket.title,
                style: TextStyles.body(
                  context: context,
                  color: theme.textPrimary,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${ticket.assignee}   • ',
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textPrimary.withValues(alpha: .5),
                      ),
                    ),
                    TextSpan(
                      text: ticket.date,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textPrimary.withValues(alpha: .5),
                      ),
                    ),
                  ],
                ),
                style: TextStyles.caption(
                  context: context,
                  color: theme.textSecondary.withValues(alpha: .5),
                ),
              ),
              const SizedBox(height: 8),
              Divider(
                thickness: .5,
                color: theme.textPrimary.withValues(alpha: .3),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: theme.backgroundPrimary,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: .7,
                        color: theme.textPrimary.withValues(alpha: .3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.circle, size: 6, color: priorityColor),
                        const SizedBox(width: 8),
                        Text(
                          ticket.priority,
                          style: TextStyles.caption(
                            context: context,
                            color: theme.textPrimary.withValues(alpha: .5),
                          ),
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
                      color: theme.backgroundPrimary,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: .7,
                        color: theme.textPrimary.withValues(alpha: .3),
                      ),
                    ),
                    child: Text(
                      ticket.status,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textPrimary.withValues(alpha: .5),
                      ),
                    ),
                  ),
                  if (ticket.isSpam == true) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.backgroundPrimary,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: .7,
                          color: theme.textPrimary.withValues(alpha: .3),
                        ),
                      ),
                      child: Text(
                        'Spam',
                        style: TextStyles.caption(
                          context: context,
                          color: theme.textPrimary.withValues(alpha: .5),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
