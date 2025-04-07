import '../../../../core/shared/shared.dart';
import '../widgets/brand_selection.dart';
import '../widgets/tags.dart';

class FilterPage extends StatelessWidget {
  static const String path = '/filter';
  static const String name = 'FilterPage';
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          appBar: AppBar(
            backgroundColor: theme.backgroundPrimary,
            title: Text(
              'Filters',
              style: TextStyles.title(
                context: context,
                color: theme.textPrimary,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Apply',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BRAND',
                  style: TextStyles.body(
                    context: context,
                    color: theme.textPrimary,
                  ),
                ),
                BrandCheckbox(onChanged: (bool? value) {}),
                const SizedBox(height: 16),
                Text(
                  'PRIORITY',
                  style: TextStyles.body(
                    context: context,
                    color: theme.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  dropdownColor: theme.backgroundPrimary,
                  borderRadius: BorderRadius.circular(8),
                  icon: Icon(Icons.arrow_drop_down, color: theme.iconColor),
                  decoration: InputDecoration(
                    fillColor: theme.cardColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  hint: Text(
                    'Select priority',
                    style: TextStyles.body(
                      context: context,
                      color: theme.textPrimary.withValues(alpha: .6),
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'Low',
                      child: Text(
                        'Low',
                        style: TextStyles.caption(
                          context: context,
                          color: theme.textPrimary,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Urgent',
                      child: Text(
                        'Urgent',
                        style: TextStyles.caption(
                          context: context,
                          color: theme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                const TagsWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
