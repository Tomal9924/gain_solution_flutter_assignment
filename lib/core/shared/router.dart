import 'package:gain_solutions_flutter_assignment/features/dashboard/presentation/pages/dashboard.dart';

import 'shared.dart';

final router = GoRouter(
  initialLocation: DashboardPage.path,
  routes: [
    GoRoute(
      path: DashboardPage.path,
      name: DashboardPage.name,
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);
