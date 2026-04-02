import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:unit_converter/core/app_strings.dart';
import 'package:unit_converter/presentation/provider/converter_provider.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: context.read<ConverterProvider>().inputText,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConverterProvider>();
    final theme = Theme.of(context);

    if (_controller.text != provider.inputText) {
      _controller.value = TextEditingValue(
        text: provider.inputText,
        selection: TextSelection.collapsed(offset: provider.inputText.length),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: AppStrings.inputLabel,
          hintText: AppStrings.inputHint,
          filled: true,
          fillColor: theme.colorScheme.surface,
          prefixIcon: const Icon(Icons.calculate_outlined),
          suffixIcon: provider.inputText.isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    _controller.clear();
                    context.read<ConverterProvider>().updateInputText('');
                    setState(() {
                    });
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
         
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: theme.colorScheme.outline.withValues(alpha: 0.4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 1.5,
            ),
          ),
        ),
        onChanged: (value) {
          context.read<ConverterProvider>().updateInputText(value);
        },
      ),
    );
  }
}
