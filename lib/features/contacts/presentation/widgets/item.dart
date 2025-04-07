import 'package:gain_solutions_flutter_assignment/features/contacts/contacts.dart';

import '../../../../core/shared/shared.dart';

class ContactCard extends StatelessWidget {
  final ContactsEntity contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.cardColor,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contact.avatar),
            ),
            title: Text(
              contact.name,
              style: TextStyles.title(
                context: context,
                color: theme.textPrimary,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.email, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      contact.email,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      contact.phone,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      contact.address,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Icon(Icons.more_vert, color: theme.textPrimary),
          ),
        );
      },
    );
  }
}
