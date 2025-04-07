import 'package:flutter/material.dart';

import '../../../../core/shared/shared.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key});

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> allTags = [
    'Tag one',
    'Tag two',
    'Tag three wit long text',
    'Tag four',
    'Tag five',
    'Tag six with long text',
    'Tag seven',
  ];
  List<String> filteredTags = [];

  @override
  void initState() {
    super.initState();
    filteredTags = List.from(allTags);
    _searchController.addListener(_filterTags);
  }

  void _filterTags() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredTags =
          allTags.where((tag) => tag.toLowerCase().contains(query)).toList();
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(children: filteredTags.map(_buildTag).toList()),
          ],
        );
      },
    );
  }
}
