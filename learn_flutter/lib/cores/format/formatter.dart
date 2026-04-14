import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppFormatter {
  static String formatMoney(BuildContext context, num value) {
    final locale = Localizations.localeOf(context).toString();

    return NumberFormat.currency(
      locale: locale,
      symbol: locale == 'vi' ? '₫' : '\$',
      decimalDigits: locale == 'vi' ? 0 : 2,
    ).format(value);
  }
}
