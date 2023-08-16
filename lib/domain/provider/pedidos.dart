import 'package:flutter/material.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';
import '../models/pedido.dart';
import '../models/produto.dart';

class Pedidos with ChangeNotifier {
  final List<Pedido> _items = [...Mock().pedidos];

  List<Pedido> get all {
    return [..._items];
  }

  List<Pedido> sortList() {
    List<Pedido> listPedidos = [..._items];
    List<Pedido> ordenado = listPedidos.toList();
    ordenado.sort((a, b) => a.cliente.nome.compareTo(b.cliente.nome));
    return ordenado;
  }

  int get count {
    return _items.length;
  }

  Pedido byIndex(int i) {
    return sortList().elementAt(i);
  }

  double totalByIndex(int i) {
    double totalPedido = 0.0;
    Pedido pedido = sortList().elementAt(i);
    int index = 0;
    pedido.produtos.forEach((produto) {
      totalPedido += produto.valor * pedido.quantidades[index];
      index++;
    });
    print(totalPedido);
    return totalPedido;
  }

  void put(Pedido pedido) {
    if (_items.contains(pedido)) {
      _items.remove(pedido);
      _items.add(Pedido(
          id: pedido.id,
          cliente: pedido.cliente,
          atendente: pedido.atendente,
          produtos: pedido.produtos,
          quantidades: pedido.quantidades));
    } else {
      _items.add(pedido);
    }
    notifyListeners();
  }

  void remove(Pedido pedido) {
    _items.remove(pedido);
    notifyListeners();
  }

  // Map<Produto, int> addUnidadeProduto(int i, int count) {
  // Map<Produto, int> quantidadeProdutos = {};
  // Produto produto = sortList().elementAt(i);
  //   if (quantidadeProdutos.containsKey(produto)) {
  //     quantidadeProdutos.update(produto, (value) => value++);
  //   } else {
  //     quantidadeProdutos.addAll({produto: count++});
  //   }
  //   notifyListeners();
  //   return quantidadeProdutos;
  // }
}
