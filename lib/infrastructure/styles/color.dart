import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

const _primaryColor = Color(0xff0C1534);

// final _darkScheme =
//     ColorScheme.fromSeed(seedColor: _primaryColor, brightness: Brightness.dark);

final _lightScheme = ColorScheme.fromSeed(
    seedColor: _primaryColor, brightness: Brightness.light);

final _palette = CorePalette.of(_primaryColor.value);

class UFTheme {
  static Color get primaryColor => _primaryColor;

  // static ColorScheme get darkScheme => _darkScheme;

  static ColorScheme get lightScheme => _lightScheme;

  static CorePalette get pallete => _palette;
}
