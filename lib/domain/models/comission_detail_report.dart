import 'package:projeto_desafio_flutter/domain/models/pedido.dart';
import 'package:projeto_desafio_flutter/domain/models/produto.dart';

class ComissionReportDetail {
  Pedido pedido;
  List<Produto> listaProdutosPorPedido;
  List<int> quantidadeProdutosPorPedido;
  List<double> listValorTotalProduto;
  ComissionReportDetail({
    required this.pedido,
    required this.listaProdutosPorPedido,
    required this.quantidadeProdutosPorPedido,
    required this.listValorTotalProduto,
  });
}
