import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UFTextTheme {
  static String get fontFamily => "Poppins";

  static TextStyle buildTextStyle(double fontSize, double height) {
    final finalFontSize = fontSize * 13 / 16;
    final finalHeight = height * 13 / 16;
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: finalFontSize.sp,
        height: finalHeight.sp.toFigmaHeight(finalFontSize.sp));
  }

  static TextTheme get textTheme => TextTheme(
      displayLarge: buildTextStyle(57, 64),
      displayMedium: buildTextStyle(45, 52),
      displaySmall: buildTextStyle(36, 44),
      headlineLarge: buildTextStyle(32, 40),
      headlineMedium: buildTextStyle(28, 36),
      headlineSmall: buildTextStyle(24, 32),
      titleLarge: buildTextStyle(22, 28),
      titleMedium: buildTextStyle(16, 24),
      titleSmall: buildTextStyle(14, 20),
      bodyLarge: buildTextStyle(16, 24),
      bodyMedium: buildTextStyle(14, 20),
      bodySmall: buildTextStyle(12, 16),
      labelLarge: buildTextStyle(14, 20),
      labelMedium: buildTextStyle(12, 16),
      labelSmall: buildTextStyle(11, 16));
}

extension FigmaDimention on num {
  double toFigmaHeight(num fontSize) {
    return this / fontSize;
  }
}
