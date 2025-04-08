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
            dense: true,
            visualDensity: VisualDensity.comfortable,
            contentPadding: const EdgeInsets.all(0),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImage(
                      imageUrl: contact.avatar,
                      height: 40,
                      width: 40,
                      placeholder: (context, url) => const ShimmerLabel(
                        width: 40,
                        height: 40,
                      ),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      contact.name,
                      style: TextStyles.title(
                        context: context,
                        color: theme.textPrimary,
                      ),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert, color: theme.textPrimary),
                  color: theme.backgroundPrimary,
                  padding: const EdgeInsets.all(0),
                  menuPadding: const EdgeInsets.all(0),
                  popUpAnimationStyle: AnimationStyle.noAnimation,
                  onSelected: (value) {},
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Text(
                        'Edit',
                        style: TextStyles.caption(
                          context: context,
                          color: theme.textPrimary,
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'view_tickets',
                      child: Text('View Tickets',
                          style: TextStyles.caption(
                            context: context,
                            color: theme.textPrimary,
                          )),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Delete',
                          style: TextStyles.caption(
                            context: context,
                            color: theme.textPrimary,
                          )),
                    ),
                  ],
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 16,
                      color: theme.iconColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      contact.email,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textPrimary.withValues(alpha: .8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.phone_in_talk_outlined,
                      size: 16,
                      color: theme.iconColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      contact.phone,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textPrimary.withValues(alpha: .8),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: theme.iconColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      contact.address,
                      style: TextStyles.caption(
                        context: context,
                        color: theme.textPrimary.withValues(alpha: .8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
