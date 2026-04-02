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
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.appTitle)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            crossAxisAlignment: .start,
            children: [
              Text(AppStrings.ChooseCategory, style: TextStyle(fontSize: 14, fontWeight: .w600)),
              CategorySelector(),
              Text(AppStrings.enterValue, style: TextStyle(fontSize: 14, fontWeight: .w600)),
              InputField(),
              Text(AppStrings.selectUnits, style: TextStyle(fontSize: 14, fontWeight: .w600)),

              Row(
                children: [
                  Expanded(
                    child: UnitDropDown(
                      label: AppStrings.formLabel,
                      selectedUnit: provider.fromUnit,
                      unit: provider.currentUnit,
                      onChanged: (value) {
                        context.read<ConverterProvider>().updateFromUnit(value!);
                      },
                    ),
                  ),
                  
                  IconButton(onPressed: () => context.read<ConverterProvider>().swap(),
                   icon: Icon(Icons.swap_horiz)),
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
              ResultCart(),
            ],
          ),
        ),
      ),
    );
  }
}
