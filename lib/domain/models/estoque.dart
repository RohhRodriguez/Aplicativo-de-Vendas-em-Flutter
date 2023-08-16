import 'package:projeto_desafio_flutter/domain/models/produto.dart';

class Estoque {
  Produto produto;
  int quantidade;
  Estoque({
    required this.produto,
    required this.quantidade,
  });

  estocar(int quantidade) {
    this.quantidade += quantidade;
  }

  vender(int quantidade) {
    this.quantidade -= quantidade;
  }
}
