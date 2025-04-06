import '../../../../core/config/config.dart';
import '../../../../core/shared/shared.dart';
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
        create:
            (context) => sl<FindAllTicketsBloc>()..add(const FindAllTickets()),
        child: const TicketsFragment(),
      ),
      const TicketsFragment(),
      const TicketsFragment(),
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
