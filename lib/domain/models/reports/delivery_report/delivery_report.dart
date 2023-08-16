import 'package:projeto_desafio_flutter/domain/models/pedido.dart';

class DeliveryReport {
  Pedido pedido;
  double totalPedido;
  double totalCompradoCliente;
  DeliveryReport({
    required this.pedido,
    required this.totalPedido,
    required this.totalCompradoCliente,
  });
}
