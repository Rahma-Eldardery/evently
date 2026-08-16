import 'package:easy_localization/easy_localization.dart';
import 'package:evently/models/event_category.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryChip extends StatelessWidget {
  final EventCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var unselectedColor = provider.themeMode == ThemeMode.dark
        ? Colors.transparent
        : Colors.white;
    var contentColor = isSelected
        ? Theme.of(context).scaffoldBackgroundColor
        : provider.colors.primaryColor();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? provider.colors.primaryColor() : unselectedColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: provider.colors.primaryColor()),
        ),
        child: Row(
          children: [
            Icon(category.icon, size: 20, color: contentColor),
            const SizedBox(width: 8),
            Text(
              category.nameKey.tr(),
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: contentColor),
            ),
          ],
        ),
      ),
    );
  }
}
