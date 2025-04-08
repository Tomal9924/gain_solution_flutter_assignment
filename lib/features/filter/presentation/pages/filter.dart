import '../../../../core/shared/shared.dart';
import '../../filter.dart';
import '../widgets/brand_selection.dart';
import '../widgets/tags.dart';

class FilterPage extends StatelessWidget {
  static const String path = '/filter';
  static const String name = 'FilterPage';

  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        final theme = themeState.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundPrimary,
          appBar: AppBar(
            backgroundColor: theme.backgroundPrimary,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: theme.textPrimary,
              ),
              onPressed: () => context.pop(),
            ),
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
          body: BlocBuilder<FindAllFilterBloc, FindAllFilterState>(
            builder: (_, state) {
              if (state is FindAllFilterError) {
                return Center(
                  child: Text(
                    state.failure.message,
                    style: TextStyles.caption(context: context, color: theme.textPrimary),
                  ),
                );
              } else if (state is FindAllFilterLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FindAllFilterDone) {
                final List<FilterEntity> filters = state.filters;
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: filters
                        .where((f) => f.enabled)
                        .map((filter) => Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: _buildDynamicFilter(filter, context, theme),
                            ))
                        .toList(),
                  ),
                );
              } else {
                return const Icon(Icons.help);
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildDynamicFilter(FilterEntity filter, BuildContext context, ThemeScheme theme) {
    switch (filter.type) {
      case 'checkbox':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              filter.label,
              style: TextStyles.body(context: context, color: theme.textPrimary),
            ),
            BrandCheckbox(
              filter: filter,
              onChanged: (v) {},
            ),
          ],
        );
      case 'dropdown':
        return _buildDropdownFilter(filter, context, theme);
      case 'searchable-tags':
        return TagsWidget(filter: filter);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildDropdownFilter(FilterEntity filter, BuildContext context, ThemeScheme theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          filter.label.toUpperCase(),
          style: TextStyles.caption(context: context, color: theme.textPrimary),
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
            'Select ${filter.label.toLowerCase()}',
            style: TextStyles.body(context: context, color: theme.textPrimary.withOpacity(0.6)),
          ),
          items: filter.options.map((option) {
            return DropdownMenuItem(
              value: option.value,
              child: Text(
                option.label,
                style: TextStyles.caption(context: context, color: theme.textPrimary),
              ),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
