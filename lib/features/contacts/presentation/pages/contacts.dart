import '../../../../core/shared/shared.dart';
import '../bloc/find_all_bloc.dart';
import '../widgets/item.dart';

class ContactsFragment extends StatefulWidget {
  const ContactsFragment({super.key});

  @override
  State<ContactsFragment> createState() => _ContactsFragmentState();
}

class _ContactsFragmentState extends State<ContactsFragment> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          body: RefreshIndicator(
            onRefresh: () async {
              _searchController.clear();
              context.read<FindAllContactsBloc>().add(
                    const FindAllContacts(query: null),
                  );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child:
                        BlocBuilder<FindAllContactsBloc, FindAllContactsState>(
                      builder: (context, state) {
                        if (state is FindAllContactsDone) {
                          return Text(
                            '${state.contacts.length} Contacts',
                            style: TextStyles.caption(
                              context: context,
                              color: theme.textPrimary,
                            ),
                          );
                        } else if (state is FindAllContactsLoading) {
                          return CircularProgressIndicator(
                            color: theme.iconColor,
                            strokeWidth: 1,
                          );
                        } else {
                          return Text(
                            '0 Contacts',
                            style: TextStyles.caption(
                              context: context,
                              color: theme.textPrimary,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                16.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _searchController,
                    style: TextStyles.caption(
                      context: context,
                      color: theme.textPrimary,
                    ),
                    onSubmitted: (value) {
                      context.read<FindAllContactsBloc>().add(
                            FindAllContacts(query: _searchController.text),
                          );
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: theme.iconColor),
                      hintText: 'Search contact',
                      hintStyle: TextStyles.caption(
                        context: context,
                        color: theme.textPrimary.withValues(alpha: .6),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                16.verticalSpace,
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
