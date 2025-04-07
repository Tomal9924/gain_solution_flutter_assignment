import '../../../../core/shared/shared.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First name',
                style: TextStyles.caption(
                  context: context,
                  color: theme.iconColor,
                ),
              ),
              Text(
                'Jonaus',
                style: TextStyles.caption(
                  context: context,
                  color: theme.textPrimary,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Last name',
                style: TextStyles.caption(
                  context: context,
                  color: theme.iconColor,
                ),
              ),
              Text(
                'Kahnwald',
                style: TextStyles.caption(
                  context: context,
                  color: theme.textPrimary,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Email',
                style: TextStyles.caption(
                  context: context,
                  color: theme.iconColor,
                ),
              ),
              Text(
                'username@email.com',
                style: TextStyles.caption(
                  context: context,
                  color: theme.textPrimary,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}
