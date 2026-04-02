import 'package:flutter/material.dart';
import 'package:unit_converter/core/app_strings.dart';
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
    _toUnit = _currentUnit[1];
  }

  String get result {
    final double? inputValue = double.tryParse(_inputText);

    if (inputValue == null) return AppStrings.resultLabel;
    final double converted = UnitCategoryModel.convert(
      value: inputValue,
      fromUnit: fromUnit,
      toUnit: toUnit,
      categoryName: _categories[_selectedCategoryIndex].name,
    );

    return _format(converted);
  }

  void selectCategory(int index) {
    _selectedCategoryIndex = index;
    _fromUnit = _currentUnit[0];
    _toUnit = _currentUnit[1];
    _inputText = '';
    notifyListeners();
  }

  void updateInputText(String value) {
    _inputText = value;
    notifyListeners();
  }

  void updateFromUnit(String unit) {
    _fromUnit = unit;
    notifyListeners();
  }

  void updateToUnit(String unit) {
    _toUnit = unit;
    notifyListeners();
  }

  void swap() {
    final temp = _fromUnit;
    _fromUnit = _toUnit;
    _toUnit = temp;

    notifyListeners();
  }

  String _format(double value) {
    String str = value.toStringAsFixed(6);

    str = str.replaceAll(RegExp(r'0+$'), '');
    str = str.replaceAll(RegExp(r'\.$'), '');
    return str;
  }
}
