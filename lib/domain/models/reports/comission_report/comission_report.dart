import 'package:projeto_desafio_flutter/domain/models/atendente.dart';

class ComissionReport {
  Atendente atendente;
  double comissaoAtendente;
  double totalVendidoAtendente;
  ComissionReport({
    required this.atendente,
    required this.comissaoAtendente,
    required this.totalVendidoAtendente,
  });
}
