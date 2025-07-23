import 'package:intl/intl.dart';

extension StringPriceExtension on String {
  String formatPrice() {
    final number = double.tryParse(this);
    if (number == null) return this;

    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }
}
