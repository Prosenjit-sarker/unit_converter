import 'package:flutter/material.dart';
import 'package:unit_converter/data/model/unit_category_model.dart';
import 'package:unit_converter/domain/entities/unit_category.dart';

class ConverterProvider extends ChangeNotifier {
  final List<UnitCategory> _categories = UnitCategoryModel.allCategoris;
  int _selectedCategoryIndex = 0;
  String _inputText = '';
  String _fromUnit = '';
  String _toUnit = '';

  List<UnitCategory> get categories => _categories;
  int get selectedCategoryIndex => _selectedCategoryIndex;
  String get inputText => _inputText;
  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;

  List<String> get _currentUnit => categories[_selectedCategoryIndex].unit;
  List<String> get currentUnit => _currentUnit;

  ConverterProvider() {
    _fromUnit = _currentUnit[0];
  }

  // UnitCategory get selectedCategory => _categories[_selectedCategoryIndex];
  // List<String> get units => selectedCategory.unit;

  // double? get result {
  //   final value = double.tryParse(_inputText);

  //   if (value == null || _fromUnit.isEmpty || _toUnit.isEmpty) {
  //     return null;
  //   }

  //   return UnitCategoryModel.convert(
  //     value: value,
  //     fromUnit: _fromUnit,
  //     toUnit: _toUnit,
  //     categoryName: selectedCategory.name,
  //   );
  // }

  // void selectCategory(int index) {
  //   if (index < 0 || index >= _categories.length) return;
  //   if (_selectedCategoryIndex == index) return;

  //   _selectedCategoryIndex = index;
  //   _setDefaultUnitsForSelectedCategory();
  //   notifyListeners();
  // }

  // void updateInputText(String value) {
  //   if (_inputText == value) return;

  //   _inputText = value;
  //   notifyListeners();
  // }

  // void updateFromUnit(String value) {
  //   if (_fromUnit == value) return;

  //   _fromUnit = value;
  //   notifyListeners();
  // }

  // void updateToUnit(String value) {
  //   if (_toUnit == value) return;

  //   _toUnit = value;
  //   notifyListeners();
  // }

  // void swapUnits() {
  //   if (_fromUnit.isEmpty || _toUnit.isEmpty) return;

  //   final currentFrom = _fromUnit;
  //   _fromUnit = _toUnit;
  //   _toUnit = currentFrom;
  //   notifyListeners();
  // }

  // void _setDefaultUnitsForSelectedCategory() {
  //   final availableUnits = selectedCategory.unit;

  //   if (availableUnits.isEmpty) {
  //     _fromUnit = '';
  //     _toUnit = '';
  //     return;
  //   }

  //   _fromUnit = availableUnits.first;
  //   _toUnit = availableUnits.length > 1
  //       ? availableUnits[1]
  //       : availableUnits.first;
  // }
}
