import 'package:projeto_desafio_flutter/domain/models/pedido.dart';

class SalesReport {
  Pedido pedido;
  double totalPedido;
  SalesReport({
    required this.pedido,
    required this.totalPedido,
  });
}
