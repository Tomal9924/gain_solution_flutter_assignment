import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
import '../../../contacts/contacts.dart';
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
            sl<FindAllContactsBloc>()..add(const FindAllContacts(query: null)),
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
                    padding: const EdgeInsets.only(left: 16),
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
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Gain Solutions',
                      style: TextStyles.subHeadline(
                        context: context,
                        color: theme.textPrimary,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Stack(
                        children: [
                          Icon(
                            Icons.notifications_none_outlined,
                            size: 24,
                            color: theme.textPrimary.withValues(alpha: .8),
                          ),
                          Positioned(
                            top: -3,
                            right: 1,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 8,
                                minHeight: 8,
                              ),
                              child: Center(
                                  child: Text(
                                '3',
                                style: TextStyles.caption(
                                        context: context,
                                        color: theme.backgroundPrimary)
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                              )),
                            ),
                          ),
                        ],
                      ),
                    )
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
