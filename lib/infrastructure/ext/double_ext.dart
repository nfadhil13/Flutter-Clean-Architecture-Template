import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumExt on num {
  String currencyFormat({String symbol = "Rp. "}) {
    final currencyFormater = NumberFormat.currency(symbol: symbol);
    final value = currencyFormater.format(this);
    return value;
  }

  SizedBox get verticalSpace => SizedBox(height: toDouble());

  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}
