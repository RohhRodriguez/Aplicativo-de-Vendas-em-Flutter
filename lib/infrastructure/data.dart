import 'package:projeto_desafio_flutter/domain/models/empresa.dart';
import 'package:uuid/uuid.dart';
import '../domain/models/atendente.dart';
import '../domain/models/cliente.dart';
import '../domain/models/estoque.dart';
import '../domain/models/pedido.dart';
import '../domain/models/produto.dart';

class DataBase {}

var uuid = Uuid();

class Mock {
  Empresa company = Empresa(companyName: 'TRIMBLE SOLUCOES LTDA', cnpj: '12.345.678/0001-87');
  List<Produto> produtos = [];
  List<Estoque> estoques = [];
  List<Atendente> atendentes = [];
  List<Cliente> clientes = [];
  List<Pedido> pedidos = [];

  Mock() {
    produtos = [
      Produto(id: uuid.v4(), nome: 'Produto A', valor: 101),
      Produto(id: uuid.v4(), nome: 'Produto B', valor: 200.98),
      Produto(id: uuid.v4(), nome: 'Produto C', valor: 300.34),
      Produto(id: uuid.v4(), nome: 'Produto D', valor: 473)
    ];
    estoques = [
      Estoque(produto: produtos[0], quantidade: 107),
      Estoque(produto: produtos[1], quantidade: 200),
      Estoque(produto: produtos[2], quantidade: 300),
      Estoque(produto: produtos[3], quantidade: 401),
    ];
    atendentes = [
      Atendente(comissao: 10, id: uuid.v4(), nome: 'Mariana Silva'),
      Atendente(comissao: 20, id: uuid.v4(), nome: 'Claudia Monteiro'),
      Atendente(comissao: 30, id: uuid.v4(), nome: 'Marcelo Pontes'),
      Atendente(comissao: 40, id: uuid.v4(), nome: 'Roberto Pereira'),
    ];
    clientes = [
      Cliente(id: uuid.v4(), nome: 'Julia Silva', endereco: 'Rua A, 11'),
      Cliente(id: uuid.v4(), nome: 'Pedro Souza', endereco: 'Rua B, 12'),
      Cliente(id: uuid.v4(), nome: 'Marilia Rodrigues', endereco: 'Rua C, 13'),
      Cliente(id: uuid.v4(), nome: 'Carlos Prado', endereco: 'Rua D, 14')
    ];
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[0],
        atendente: atendentes[1],
        produtos: [produtos[0], produtos[1]],
        quantidades: [1, 1]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[0],
        atendente: atendentes[1],
        produtos: [produtos[0], produtos[1]],
        quantidades: [2, 2]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[0],
        atendente: atendentes[0],
        produtos: [produtos[2], produtos[3]],
        quantidades: [1, 1]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[1],
        atendente: atendentes[0],
        produtos: [produtos[0], produtos[1], produtos[2]],
        quantidades: [30, 40, 50]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[1],
        atendente: atendentes[1],
        produtos: [produtos[2], produtos[3]],
        quantidades: [10, 20]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[1],
        atendente: atendentes[0],
        produtos: [produtos[2], produtos[3]],
        quantidades: [14, 38]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[1],
        atendente: atendentes[1],
        produtos: [produtos[2], produtos[3]],
        quantidades: [12, 36]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[2],
        atendente: atendentes[1],
        produtos: [produtos[2], produtos[3]],
        quantidades: [1, 1]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[3],
        atendente: atendentes[3],
        produtos: [produtos[0], produtos[3]],
        quantidades: [3, 5]));
    pedidos.add(Pedido(
        id: uuid.v4(),
        cliente: clientes[3],
        atendente: atendentes[2],
        produtos: [produtos[2], produtos[3]],
        quantidades: [15, 12]));
  }
}
