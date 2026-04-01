import 'package:flutter/material.dart';
import 'package:unit_converter/domain/entities/unit_category.dart';

class UnitCategoryModel extends UnitCategory {
  const UnitCategoryModel({required super.name, required super.iconData, required super.unit});

  static const List<UnitCategoryModel> allCategoris = [
    UnitCategoryModel(
      name: 'Length',
      iconData: Icons.straighten,
      unit: ['Meter', 'Kilometer', 'Mile', 'Foot', 'Inch', 'Centimeter'],
    ),
    UnitCategoryModel(name: 'Weight', iconData: Icons.fitness_center, unit: ['Kilogram', 'Gram', 'Pound', 'Ounce']),
    UnitCategoryModel(name: 'Temparature', iconData: Icons.thermostat, unit: ['Celsius', 'Farenheit', 'Kelvin']),
  ];

static double convert({
  required double value,
  required String fromUnit,
  required String toUnit,
  required String categoryName,
}) {

  if (fromUnit == toUnit) return value;

  switch (categoryName) {
    case 'Length':
      return _convertLength(value, fromUnit, toUnit);

    case 'Weight':
      return _convertWeight(value, fromUnit, toUnit);

    case 'Temparature':
      return _convertTemparature(value, fromUnit, toUnit);

    default:
      return value;
  }
}

  static double _convertLength(double value, String from, String to) {
  double meters = _toMeters(value, from);
  return _fromMeters(meters, to);
}

// to meters
static double _toMeters(double value, String unit) {
  switch (unit) {
    case 'Meter':
      return value;
    case 'Kilometer':
      return value * 1000;
    case 'Mile':
      return value * 1609.34;
    case 'Foot':
      return value * 0.3048;
    case 'Inch':
      return value * 0.0254; // FIXED
    case 'Centimeter':
      return value * 0.01;
    default:
      return value;
  }
}

// from meters
static double _fromMeters(double value, String unit) {
  switch (unit) {
    case 'Meter':
      return value;
    case 'Kilometer':
      return value / 1000;
    case 'Mile':
      return value / 1609.34;
    case 'Foot':
      return value / 0.3048;
    case 'Inch':
      return value / 0.0254;
    case 'Centimeter':
      return value / 0.01;
    default:
      return value;
  }
}
  //_convertTemparature
  static double _convertTemparature(double value, String from, String to) {
  double celsius;

  // convert to Celsius first
  switch (from) {
    case 'Celsius':
      celsius = value;
      break;
    case 'Farenheit':
      celsius = (value - 32) * 5 / 9;
      break;
    case 'Kelvin':
      celsius = value - 273.15;
      break;
    default:
      celsius = value;
  }

  // convert from Celsius to target
  switch (to) {
    case 'Celsius':
      return celsius;
    case 'Farenheit':
      return (celsius * 9 / 5) + 32;
    case 'Kelvin':
      return celsius + 273.15;
    default:
      return celsius;
  }
}

//convert weight

static double _convertWeight(double value, String from, String to) {
  double kg = _toKilograms(value, from);
  return _fromKilograms(kg, to);
}

// to kilograms
static double _toKilograms(double value, String unit) {
  switch (unit) {
    case 'Kilogram':
      return value;
    case 'Gram':
      return value / 1000;
    case 'Pound':
      return value * 0.453592;
    case 'Ounce':
      return value * 0.0283495;
    default:
      return value;
  }
}

// from kilograms
static double _fromKilograms(double value, String unit) {
  switch (unit) {
    case 'Kilogram':
      return value;
    case 'Gram':
      return value * 1000;
    case 'Pound':
      return value / 0.453592;
    case 'Ounce':
      return value / 0.0283495;
    default:
      return value;
  }
}
}
