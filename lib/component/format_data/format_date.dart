import 'package:intl/intl.dart';

class FormatData {
  getDataFormat(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }
}
