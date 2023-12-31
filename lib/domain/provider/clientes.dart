import 'package:flutter/material.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';

import '../models/cliente.dart';

class Clientes with ChangeNotifier {
  final List<Cliente> _items = [...Mock().clientes];

  List<Cliente> get all {
    return [..._items];
  }

  List<Cliente> sortList() {
    List<Cliente> listClients = [..._items];
    List<Cliente> ordenado = listClients.toList();
    ordenado.sort((a, b) => a.nome.compareTo(b.nome));
    return ordenado;
  }

  int get count {
    return _items.length;
  }

  Cliente byIndex(int i) {
    return sortList().elementAt(i);
  }

  void put(Cliente cliente) {
    if (_items.contains(cliente)) {
      _items.remove(cliente);
      _items.add(Cliente(endereco: cliente.endereco, id: cliente.id, nome: cliente.nome));
    } else {
      _items.add(cliente);
    }
    notifyListeners();
  }

  void remove(Cliente cliente) {
    _items.remove(cliente);
    notifyListeners();
  }
}




























































































































































































































































































































































































































// class Produtos with ChangeNotifier {
//   Map<String, Produto> _items = {};
// }

// class Cliente with ChangeNotifier {
//   Map<String, Cliente> _items = {};
// }

// class Pedidos with ChangeNotifier {
//   Map<String, Pedido> _items = {};
// }
