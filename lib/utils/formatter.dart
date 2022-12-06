

import 'package:intl/intl.dart';

class Formatter {

  static String formatCurrency(String number) {
    number = number.replaceAll(".", "");
    const _locale = 'en';
    String _formatNumber() => NumberFormat.decimalPattern(_locale).format(int.parse(number));
    return _formatNumber();
  }

  static String formatCurrencyRupiah(double number) {
    const _locale = 'en';
    String _formatNumber() => NumberFormat.decimalPattern(_locale).format(number.round());
    return _formatNumber();
  }

}