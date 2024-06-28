import 'package:flutter/material.dart';

// Color custom
//const _customColor = Color.fromARGB(0, 2, 45, 173);

const List<Color> _themeColors = [
  Colors.indigo,
  Colors.cyan,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.blue,
  Colors.orange,
  Colors.pink,
  Colors.purple,
  Colors.red,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert (selectedColor >= 0 && selectedColor < _themeColors.length,
    'Colors must be between 0 and ${_themeColors.length}');
  

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: _themeColors[selectedColor],
//        brightness: Brightness.dark,  <-- Tema oscuro o claro
        );
  }
}
