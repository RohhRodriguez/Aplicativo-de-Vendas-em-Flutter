import 'package:projeto_desafio_flutter/domain/models/estoque.dart';

class StockReport {
  List<Estoque> estoques;
  List<double> totalEstoqueGeral;
  StockReport({
    required this.estoques,
    required this.totalEstoqueGeral,
  });
}
