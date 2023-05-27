import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String hourStringForm({String pattern = "HH:MM", String locale = 'id'}) =>
      DateFormat(pattern).format(this);
  
  String dateStringForm({String pattern = "HH:MM", String locale = 'id'}) {
    final dateFormater =  DateFormat('dd/MM/yyyy');
    return dateFormater.format(this);
  }
}
