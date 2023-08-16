import 'package:intl/intl.dart';

extension FormatacoesDouble on double {
  String currencyFormat(double value) {
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return formatter.format(value);
  }
}
  // final formatter = NumberFormat("#,###.00", "pt_BR");
  // formatter.format(totalComissoes)