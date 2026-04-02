import 'package:flutter/material.dart';

class UnitDropDown extends StatefulWidget {
  const UnitDropDown({
    super.key,
    required this.label,
    required this.selectedUnit,
    required this.unit,
    required this.onChanged,
  });

  final String label;
  final String selectedUnit;
  final List<String> unit;
  final ValueChanged<String?> onChanged;

  @override
  State<UnitDropDown> createState() => _UnitDropDownState();
}

class _UnitDropDownState extends State<UnitDropDown> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: widget.unit.contains(widget.selectedUnit)
              ? widget.selectedUnit
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: theme.colorScheme.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.4),
              ),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down_rounded),
          borderRadius: BorderRadius.circular(16),
          items: widget.unit
              .map(
                (unit) => DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                ),
              )
              .toList(),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
