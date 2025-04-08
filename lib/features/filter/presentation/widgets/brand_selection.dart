import 'package:flutter_svg/svg.dart';
import 'package:gain_solutions_flutter_assignment/features/filter/domain/entities/tag.dart';
import 'package:gain_solutions_flutter_assignment/features/filter/filter.dart';

import '../../../../core/shared/shared.dart';

class BrandCheckbox extends StatefulWidget {
  final FilterEntity filter;
  final ValueChanged<bool?> onChanged;

  const BrandCheckbox({super.key, required this.onChanged, required this.filter});

  @override
  State<BrandCheckbox> createState() => _BrandCheckboxState();
}

class _BrandCheckboxState extends State<BrandCheckbox> {
  String? selectedBrand;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.filter.options.length,
          itemBuilder: (context, index) {
            TagOption brand = widget.filter.options[index];
            final isSelected = selectedBrand == brand.label;
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
                    selectedBrand = brand.label;
                  });
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    width: 24.w,
                    height: 24.w,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    brand.label,
                    style: TextStyles.caption(
                      context: context,
                      color: theme.textPrimary,
                    ),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  selectedBrand = brand.label;
                });
              },
            );
          },
        );
      },
    );
  }
}
