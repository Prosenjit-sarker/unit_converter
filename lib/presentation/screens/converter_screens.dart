import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';
import 'package:unit_converter/presentation/widgets/category_selector.dart';
import 'package:unit_converter/presentation/widgets/input_field.dart';
import 'package:unit_converter/presentation/widgets/result_cart.dart';
import 'package:unit_converter/presentation/widgets/unit_drop_down.dart';

class ConverterScreens extends StatelessWidget {
  const ConverterScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.withAlpha(80),
        title: Text(
          AppStrings.appTitle,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.ChooseCategory,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              CategorySelector(),
              Text(
                AppStrings.enterValue,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              InputField(),
              Text(
                AppStrings.selectUnits,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: UnitDropDown(
                      label: AppStrings.formLabel,
                      selectedUnit: provider.fromUnit,
                      unit: provider.currentUnit,
                      onChanged: (value) {
                        context
                            .read<ConverterProvider>()
                            .updateFromUnit(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: IconButton(
                      onPressed: () => context.read<ConverterProvider>().swap(),
                      tooltip: AppStrings.swapTooltip,
                      color: theme.colorScheme.onPrimary,
                      icon: const Icon(Icons.swap_horiz_rounded),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: UnitDropDown(
                      label: AppStrings.toLabel,
                      selectedUnit: provider.toUnit,
                      unit: provider.currentUnit,
                      onChanged: (value) {
                        context.read<ConverterProvider>().updateToUnit(value!);
                      },
                    ),
                  ),
                ],
              ),
              const ResultCart(),
            ],
          ),
        ),
      ),
    );
  }
}
