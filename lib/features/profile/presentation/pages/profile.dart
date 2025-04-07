import '../../../../core/shared/shared.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://example.com/avatar3.jpg',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jonaus Kahnwald',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('Support', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'BASIC INFO',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('First name'),
                const Text(
                  'Jonaus',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('Last name'),
                const Text(
                  'Kahnwald',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('Email'),
                const Text(
                  'username@email.com',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                const Text(
                  'ASSIGNED ROLES (3)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('Manager'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Group'),
                    const Spacer(),
                    const Text('Agent'),
                  ],
                ),
                Row(
                  children: [
                    const Text('Codecyaneon support'),
                    const Spacer(),
                    const Text('Group'),
                  ],
                ),
                Row(
                  children: [
                    const Text('Jonaus Kahnwald'),
                    const Spacer(),
                    const Text('Manager'),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Log out'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
