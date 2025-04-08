import 'package:gain_solutions_flutter_assignment/features/tickets/tickets.dart';

import '../../../../core/shared/shared.dart';
import '../../../filter/presentation/pages/filter.dart';
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
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<FindAllTicketsBloc>().add(const FindAllTickets());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      BlocBuilder<FindAllTicketsBloc, FindAllTicketsState>(
                        builder: (context, state) {
                          if (state is FindAllTicketsLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is FindAllTicketsError) {
                            return Center(child: Text(state.failure.message));
                          } else if (state is FindAllTicketsDone) {
                            return Text(
                              '${state.tickets.length} Tickets',
                              style: TextStyles.body(
                                context: context,
                                color: theme.textPrimary.withValues(alpha: .6),
                              ).copyWith(fontWeight: FontWeight.bold),
                            );
                          } else {
                            return const Icon(Icons.error);
                          }
                        },
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          context.pushNamed(FilterPage.name);
                        },
                        child: Icon(
                          Icons.filter_alt_outlined,
                          size: 24,
                          color: theme.textPrimary.withValues(alpha: .6),
                        ),
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
                        return const Center(
                            child: Text("Something went wrong!"));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
