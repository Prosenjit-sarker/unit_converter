import 'package:flutter/material.dart';
import 'package:unit_converter/domain/entities/unit_category.dart';

class UnitCategoryModel extends UnitCategory {
  UnitCategoryModel({required super.name, required super.iconData, required super.unit});

  List<UnitCategoryModel> allCategoris = [
    UnitCategoryModel(
      name: 'Length',
      iconData: Icons.straighten,
      unit: ['Meter', 'Kilometer', 'Mile', 'Foot', 'Inch', 'Centimeter'],
    ),
    UnitCategoryModel(name: 'Weight', iconData: Icons.fitness_center, unit: ['Kilogram','Gram','Pound', 'Ounce'],),
    UnitCategoryModel(name: 'Temparature', iconData: Icons.thermostat, unit: ['Celsius', 'Farenheit', 'Kelvin']),
  ];
}
