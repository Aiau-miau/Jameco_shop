import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String formatTenge(double amount) {
  
    final formatter = NumberFormat.currency(
      symbol: '₸',
      decimalDigits: 0, 
      locale: 'kk_KZ', 
    );
    return formatter.format(amount);
  }
}
