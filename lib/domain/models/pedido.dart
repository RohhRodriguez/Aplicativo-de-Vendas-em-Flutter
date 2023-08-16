import 'package:projeto_desafio_flutter/domain/models/produto.dart';
import 'atendente.dart';
import 'cliente.dart';

class Pedido {
  String id;
  Cliente cliente;
  Atendente atendente;
  List<Produto> produtos = [];
  List<int> quantidades = [];
  Pedido({
    required this.id,
    required this.cliente,
    required this.atendente,
    required this.produtos,
    required this.quantidades,
  });
}
