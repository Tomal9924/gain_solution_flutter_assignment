import 'package:gain_solutions_flutter_assignment/features/dashboard/presentation/pages/dashboard.dart';

import '../../features/filter/filter.dart';
import '../config/config.dart';
import 'shared.dart';

final router = GoRouter(
  initialLocation: DashboardPage.path,
  routes: [
    GoRoute(
      path: DashboardPage.path,
      name: DashboardPage.name,
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: FilterPage.path,
      name: FilterPage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<FindAllFilterBloc>()..add(const FindAllFilter()),
        child: const FilterPage(),
      ),
    ),
  ],
);
