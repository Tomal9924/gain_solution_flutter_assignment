import 'package:gain_solutions_flutter_assignment/features/filter/domain/entities/tag.dart';

import '../../../../core/shared/shared.dart';
import '../../domain/entities/filter.dart';

class TagsWidget extends StatefulWidget {
  final FilterEntity filter;
  const TagsWidget({
    super.key,
    required this.filter,
  });

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  final TextEditingController _searchController = TextEditingController();

  List<TagOption> filteredTags = [];

  @override
  void initState() {
    super.initState();
    filteredTags = List.from(widget.filter.options);
    _searchController.addListener(_filterTags);
  }

  void _filterTags() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredTags = widget.filter.options.where((tag) => tag.label.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget _buildTag(String tag) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _searchController.text = tag;
              });
            },
            child: Chip(
              backgroundColor: theme.backgroundPrimary,
              side: BorderSide(color: theme.iconColor, width: .5),
              label: Text(
                tag,
                style: TextStyles.caption(
                  context: context,
                  color: theme.textPrimary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TAGS',
              style: TextStyles.body(
                context: context,
                color: theme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _searchController,
              style: TextStyles.caption(
                context: context,
                color: theme.textPrimary,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: theme.iconColor),
                hintText: 'Search tags',
                hintStyle: TextStyles.caption(
                  context: context,
                  color: theme.textPrimary.withValues(alpha: .6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              children: widget.filter.options.map((option) {
                return _buildTag(option.label);
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
