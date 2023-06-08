import 'package:flutter/material.dart';

enum ButtonIconType {
  far(MainAxisAlignment.spaceAround),
  near(MainAxisAlignment.center);

  final MainAxisAlignment mainAxisAlignment;
  const ButtonIconType(this.mainAxisAlignment);
}
