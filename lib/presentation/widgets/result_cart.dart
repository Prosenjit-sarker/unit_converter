import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';

class ResultCart extends StatelessWidget {
  const ResultCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConverterProvider>(
      builder: (context, provider, child) {
        final theme = Theme.of(context);
        final hasResult = provider.result != AppStrings.resultHint;

        return Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.resultLabel,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onPrimaryContainer.withValues(
                    alpha: 0.75,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                provider.result,
                style: (hasResult
                        ? theme.textTheme.headlineMedium
                        : theme.textTheme.titleMedium)
                    ?.copyWith(
                  fontWeight: hasResult ? FontWeight.w800 : FontWeight.w500,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
