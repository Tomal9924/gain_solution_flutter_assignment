import '../../../../core/shared/shared.dart';

class TicketsPage extends StatelessWidget {
  static const String path = '/tickets';
  static const String name = 'TicketsPage';
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          body: Placeholder(),
        );
      },
    );
  }
}
