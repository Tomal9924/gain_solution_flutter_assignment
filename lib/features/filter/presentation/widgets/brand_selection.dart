import '../../../../core/shared/shared.dart';

class BrandCheckbox extends StatefulWidget {
  final ValueChanged<bool?> onChanged;

  const BrandCheckbox({super.key, required this.onChanged});

  @override
  State<BrandCheckbox> createState() => _BrandCheckboxState();
}

class _BrandCheckboxState extends State<BrandCheckbox> {
  final List<String> brands = ['Gains', 'GainSolution', 'GainHQ'];
  String? selectedBrand;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return ListView.builder(
          itemCount: brands.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            String brand = brands[index];
            final isSelected = selectedBrand == brand;

            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Checkbox(
                value: isSelected,
                activeColor: theme.primary,
                checkColor: theme.backgroundPrimary,
                onChanged: (_) {
                  setState(() {
                    selectedBrand = brand;
                  });
                },
              ),
              title: Row(
                children: [
                  Icon(Icons.grain, color: theme.primary),
                  SizedBox(width: 8.w),
                  Text(
                    brand,
                    style: TextStyles.caption(
                      context: context,
                      color: theme.textPrimary,
                    ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedBrand = brand;
                });
              },
            );
          },
        );
      },
    );
  }
}
