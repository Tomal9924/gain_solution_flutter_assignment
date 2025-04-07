import '../../../../core/shared/shared.dart';
import '../widgets/profile_body.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  final roles = [
    {
      "title": "Manager",
      "group": "Codecanyeon support",
      "manager": "Jonaus Kahnwald",
      "avatar": "https://via.placeholder.com/150", // Replace with real image
    },
    {
      "title": "Agent",
      "group": "Laravel team",
      "manager": "Lana Smith",
      "avatar": "https://via.placeholder.com/150",
    },
    {
      "title": "Reviewer",
      "group": "UI Testing",
      "manager": "Sophie Taylor",
      "avatar": "https://via.placeholder.com/150",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue.shade50),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
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
                          Text(
                            'Jonaus Kahnwald',
                            style: TextStyles.title(
                              context: context,
                              color: theme.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Support',
                            style: TextStyles.caption(
                              context: context,
                              color: theme.iconColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit_square, size: 24),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'BASIC INFO',
                  style: TextStyles.caption(
                    context: context,
                    color: theme.iconColor,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const ProfileBody(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'ASSIGNED ROLES (3)',
                  style: TextStyles.caption(
                    context: context,
                    color: theme.iconColor,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: context.height * .21,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: roles.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final role = roles[index];
                    return Container(
                      width: context.width * .7,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.cardColor.withValues(alpha: .6),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            role["title"]!,
                            style: TextStyles.title(
                              context: context,
                              color: theme.textPrimary,
                            ),
                          ),
                          Divider(thickness: .5, color: theme.iconColor),
                          const SizedBox(height: 4),
                          Text(
                            "Group",
                            style: TextStyles.caption(
                              context: context,
                              color: theme.iconColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            role["group"]!,
                            style: TextStyles.caption(
                              context: context,
                              color: theme.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Manager",
                            style: TextStyles.caption(
                              context: context,
                              color: theme.iconColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundImage: NetworkImage(role["avatar"]!),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  role["manager"]!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.caption(
                                    context: context,
                                    color: theme.textPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade100,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  icon: Icon(Icons.logout, color: theme.negative),
                  label: Text(
                    'Log out',
                    style: TextStyles.caption(
                      context: context,
                      color: theme.negative,
                    ).copyWith(fontWeight: FontWeight.bold, letterSpacing: 2),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
