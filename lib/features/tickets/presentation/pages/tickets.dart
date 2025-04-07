import 'package:gain_solutions_flutter_assignment/features/tickets/tickets.dart';

import '../../../../core/shared/shared.dart';
import '../widgets/item.dart';

class TicketsFragment extends StatelessWidget {
  const TicketsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      '124 Tickets',
                      style: TextStyles.body(
                        context: context,
                        color: theme.textPrimary.withValues(alpha: .6),
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.filter_alt_outlined,
                      size: 24,
                      color: theme.textPrimary.withValues(alpha: .6),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<FindAllTicketsBloc, FindAllTicketsState>(
                  builder: (context, state) {
                    if (state is FindAllTicketsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FindAllTicketsError) {
                      return Center(child: Text(state.failure.message));
                    } else if (state is FindAllTicketsDone) {
                      return ListView.builder(
                        itemCount: state.tickets.length,
                        itemBuilder: (context, index) {
                          return TicketCard(ticket: state.tickets[index]);
                        },
                      );
                    } else {
                      return Center(child: Text("Something went wrong!"));
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
