import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provaider = context.watch<ConverterProvider>();
    return Row(
      spacing: 10,
      children: List.generate(provaider.categories.length, (index) {
        final category = provaider.categories[index];
        final isSelected = provaider.selectedCategoryIndex == index;
        return GestureDetector(
          onTap: () => context.read<ConverterProvider>().selectCategory(index),
          child: Container(
            padding: .all(20),
            decoration: BoxDecoration(color: isSelected ? Theme.of(context).colorScheme.primary.withAlpha(80)
             : Theme.of(context).colorScheme.surfaceContainerHigh, 
          borderRadius: .circular(16),
          ),
          child: Column(
            children: [
              Icon(category.iconData), Text(category.name)
          
            ],
          ),
          ),
        );
      }),
    );
  }
}
