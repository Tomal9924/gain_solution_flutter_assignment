import '../../../../core/shared/shared.dart';
import '../bloc/find_all_bloc.dart';
import '../widgets/item.dart';

class ContactsFragment extends StatelessWidget {
  const ContactsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '42 Contacts',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<FindAllContactsBloc, FindAllContactsState>(
                  builder: (context, state) {
                    if (state is FindAllContactsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FindAllContactsError) {
                      return Center(child: Text(state.failure.message));
                    } else if (state is FindAllContactsDone) {
                      return ListView.builder(
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) {
                          return ContactCard(contact: state.contacts[index]);
                        },
                      );
                    } else {
                      return const Center(child: Text("Something went wrong!"));
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
