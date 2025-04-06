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
          appBar: AppBar(
            title: const Text('Gain Solutions'),
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const FilterScreen(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search contacts',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '42 Contacts',
                    style: TextStyle(color: Colors.grey),
                  ),
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
