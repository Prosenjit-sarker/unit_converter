import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    final theme = Theme.of(context);
    return Row(
      spacing: 10,
      children: List.generate(provider.categories.length, (index) {
        final category = provider.categories[index];
        final isSelected = provider.selectedCategoryIndex == index;
        return Expanded(
          child: GestureDetector(
            onTap: () => context.read<ConverterProvider>().selectCategory(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: isSelected
                    ? theme.colorScheme.primaryContainer
                    : theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? theme.colorScheme.primary.withValues(alpha: 0.2)
                      : theme.colorScheme.outline.withValues(alpha: 0.12),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    category.iconData,
                    color: isSelected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? theme.colorScheme.onPrimaryContainer
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
