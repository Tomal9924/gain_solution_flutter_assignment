import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../contacts/contacts.dart';
import '../../../contacts/presentation/pages/contacts.dart';
import '../../../profile/profile.dart';
import '../../../tickets/tickets.dart';

class DashboardPage extends StatefulWidget {
  static const String path = '/dashboard';
  static const String name = 'DashboardPage';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final List<Widget> fragments;
  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.people_alt_outlined,
    Icons.person_outlined,
  ];

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    fragments = [
      BlocProvider(
        create: (context) =>
            sl<FindAllTicketsBloc>()..add(const FindAllTickets()),
        child: const TicketsFragment(),
      ),
      BlocProvider(
        create: (context) =>
            sl<FindAllContactsBloc>()..add(const FindAllContacts()),
        child: const ContactsFragment(),
      ),
      const ProfileFragment(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          body: fragments.elementAt(currentIndex),
          appBar: currentIndex == 2
              ? AppBar(
                  backgroundColor: theme.backgroundPrimary,
                  elevation: 0,
                  centerTitle: false,
                  title: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'My Profile',
                      style: TextStyles.subHeadline(
                        context: context,
                        color: theme.textPrimary,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : AppBar(
                  backgroundColor: theme.backgroundPrimary,
                  elevation: 0,
                  centerTitle: false,
                  title: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      'Gain Solutions',
                      style: TextStyles.subHeadline(
                        context: context,
                        color: theme.textPrimary,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.notifications_active_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            selectedItemColor: theme.primary,
            unselectedItemColor: theme.textPrimary.withValues(alpha: 0.5),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.confirmation_number),
                label: 'Tickets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        );
      },
    );
  }
}
