import 'package:projeto_desafio_flutter/presentation/core/utils/extensions.dart';
import '../../../domain/models/pedido.dart';
import '../../../infrastructure/data.dart';
import '../report_generic_service.dart';

class ReportService {
  Mock mock = Mock();

  totalReport(EReport eReport) {
    var totalSales = 0.0;
    var totalComission = 0.0;
    var totalStock = 0.0;
    for (var pedidos in mock.pedidos) {
      var i = 0;
      for (var produto in pedidos.produtos) {
        var comission = pedidos.atendente.comissao / 100 * produto.valor * pedidos.quantidades[i];
        totalComission += comission;
        totalSales += produto.valor * pedidos.quantidades[i];
        i++;
      }
    }
    for (var estoque in mock.estoques) {
      var tStockProduct = estoque.produto.valor * estoque.quantidade;
      totalStock += tStockProduct;
    }
    switch (eReport) {
      case EReport.salesReport:
        return totalSales;
      case EReport.commissionReport:
        return totalComission;
      case EReport.stockReport:
        return totalStock;
      case EReport.deliveryReport:
        return mock.pedidos.length;
    }
  }
}

class SalesReportS extends ReportService {
  Mock mock = Mock();
  String clientName = '';
  String clientId = '';
  String clientEndereco = '';
  String atendentName = '';
  String idOrder = '';
  int itemCount = 0;
  double totalOrder = 0.0;
  Map<String, dynamic> productsOrder = {};
  String divisorReport = '.' * 80;
  List<String> productsDetail = [];
  double totalSales = 0.0;
  double totalPorCliente = 0.0;
  List<Pedido> listPedido = [];

  convertToList(int i) {
    clientName = mock.pedidos[i].cliente.nome;
    clientId = mock.pedidos[i].cliente.id;
    clientEndereco = mock.pedidos[i].cliente.endereco;
    atendentName = mock.pedidos[i].atendente.nome;
    idOrder = mock.pedidos[i].id;
    itemCount = mock.pedidos.length;
    productsOrder = {};
    totalOrder = 0.0;

    var index = 0;
    for (var p in mock.pedidos[i].produtos) {
      totalOrder += mock.pedidos[i].quantidades[index] * p.valor;
      index++;
    }
  }

  orderDetail(Pedido order) {
    var index = 0;
    order.produtos.forEach((element) {
      var totalProduct = element.valor * order.quantidades[index];
      productsDetail.add(
          '\n${element.nome} - qtde: ${order.quantidades[index]} - Valor: R\$ ${element.valor.currencyFormat(element.valor)}\nTotal: R\$ ${totalProduct.currencyFormat(totalProduct)}\n');

      totalOrder += element.valor * order.quantidades[index];
      index++;
    });
  }

  // void relatorioEntregas(int i) {
  //   clientEndereco = mock.clientes[i].endereco;
  //   clientId = mock.clientes[i].id;
  //   clientName = mock.clientes[i].nome;
  //   itemCount = mock.pedidos.length;
  //   var count = 0;
  //   var totalSales = 0.0;
  //   for (var cliente in mock.clientes) {
  //     var clienteSelecionado = clientName;
  //     var index = 0;
  //     var totalPorCliente = 0.0;
  //     var qtde = 0;
  //     Map<Produto, int> mapPedido = {};
  //     for (var pedido in mock.pedidos) {
  //       if (pedido.cliente.nome != clienteSelecionado) {
  //         continue;
  //       }
  //       for (var produto in pedido.produtos) {
  //         var unidades = pedido.quantidades[index];
  //         index++;
  //         var v = unidades * produto.valor;
  //         totalPorCliente += v;
  //         mapPedido.isEmpty
  //             ? mapPedido.addAll({produto: unidades})
  //             : mapPedido.containsKey(produto)
  //                 ? mapPedido.update(produto, (value) => value += unidades)
  //                 : mapPedido.addAll({produto: unidades});
  //       }
  //       index = 0;
  //       qtde++;
  //     }
  //     mapPedido.forEach((key, value) {
  //       productsDetail.add('\NPedido[] - ${key.nome} - quantidade: $value\n');
  //       print(
  //           'produto: ${key.nome} - quantidade: $value - valor unidade: R\$ ${key.valor} - valor total: R\$ ${key.valor * value}');
  //     });
  //     count++;
  //     totalSales += totalPorCliente;
  //   // }
  //   // count = 0;
  // }
////////////////////////////////////////////////////////////////////////////////////
  // void relatorioEntregas(Cliente cliente) {
  //   clientEndereco = cliente.endereco;
  //   clientId = cliente.id;
  //   itemCount = mock.pedidos.length;
  //   List<Pedido> listPedido = [];
  //   clientName = cliente.nome;
  //   var index = 0;
  //   mock.pedidos.forEach((element) {
  //     if (element.cliente.nome == clientName) {
  //       element.produtos.forEach((p) {
  //         var unidades = element.quantidades[index];
  //         var v = unidades * p.valor;
  //         index++;
  //         totalPorCliente += v;
  //         listPedido.isEmpty
  //             ? listPedido.add(element)
  //             : listPedido.contains(element)
  //                 ? unidades += unidades
  //                 : listPedido.add(element);
  //       });
  //       index = 0;
  //     } else {
  //       // print('object');
  //       null;
  //     }
  //   });

  //   listPedido.forEach((element) {
  //     element.cliente.nome == cliente.nome ? productsDetail.add('\n${element.id} - ${element.cliente}\n') : print('');
  //   });
////////////////////////////////////////////////////////////////////
  // clientId = mock.clientes[i].id;
  // clientEndereco = mock.clientes[i].endereco;
  // itemCount = mock.pedidos.length;
  // var count = 0;
  // // var index = 0;
  // List<Pedido> listPedido = [];
  // Map<Produto, int> mapPedido = {};
  // for (var pedido in mock.pedidos) {
  //   var index = 0;
  //   idOrder = pedido.id;
  //   if (pedido.cliente.nome == clientName) {
  //     var unidades = pedido.quantidades[index];
  //     listPedido.isEmpty
  //         ? listPedido.add(pedido)
  //         : listPedido.contains(pedido)
  //             ? pedido.quantidades[index] += unidades
  //             : listPedido.add(pedido);
  //     // productsDetail.add('\n${pedido.id}\n');
  //   } else {
  //     null;
  //   }
  //   // count++;
  // }
  // index = 0;
  // count = 0;
  // var n = 0;
  // listPedido.forEach((element) {
  //   if (element.cliente.nome == clientName) {
  //     productsDetail.add('\n${element.id}\n');
  //     print(element.id);
  //     element.produtos.forEach((p) {
  //       print('${element.cliente.nome} - ${p.nome} - ${p.valor} - ${element.quantidades[n]}');
  //       totalOrder = p.valor * element.quantidades[n];
  //       productsDetail.add('${p.nome} - qtde: ${element.quantidades[n]} - valor: ${p.valor}\n');
  //       n++;
  //     });
  //     n = 0;
  //   } else {
  //     print('object');
  //   }
  // });
}

  // deliveryDetail(listPedido, Cliente cliente) {
  //   var index = 0;
  //   listPedido.forEach((element) {
  //     if (element.cliente.nome == cliente.nome) {
  //       print(element.cliente.nome);
  //       productsDetail.add(
  //           '\n${element.nome} - qtde: ${listPedido.quantidades[index]} - Valor: R\$ ${element.valor.currencyFormat(element.valor)}\nTotal: R\$ ${'totalProduct.currencyFormat(totalProduct)'}\n');
  //       index++;
  //     } else {
  //       print('nao');
  //     }
  //   });
  // }

  // productsDetail.add('\n${pedido.id}\n');
  // for (var produto in pedido.produtos) {
  //   var unidades = pedido.quantidades[index];
  //   index++;
  //   var v = unidades * produto.valor;
  //   totalPorCliente += v;
  //   mapPedido.isEmpty
  //       ? mapPedido.addAll({produto: unidades})
  //       : mapPedido.containsKey(produto)
  //           ? mapPedido.update(produto, (value) => value += unidades)
  //           : mapPedido.addAll({produto: unidades});
  // }
  // count = 0;
  // mapPedido.forEach((key, value) {
  //   productsDetail.add('${key.nome} - qtde: ${value}\n');
  //   // print('${key.nome} - qtde: $value - valor: R\$ ${key.valor}\nTotal: R\$ ${key.valor * value}');
  // });
  // for (var pedido in mock.pedidos) {
  //   var index = 0;
  //   idOrder = pedido.id;
  //   if (pedido.cliente.nome != clientName) {
  //     continue;
  //   }
  //   productsDetail.add('\n${pedido.id}\n');
  //   for (var produto in pedido.produtos) {
  //     var unidades = pedido.quantidades[index];
  //     index++;
  //     var v = unidades * produto.valor;
  //     totalPorCliente += v;
  //     mapPedido.isEmpty
  //         ? mapPedido.addAll({produto: unidades})
  //         : mapPedido.containsKey(produto)
  //             ? mapPedido.update(produto, (value) => value += unidades)
  //             : mapPedido.addAll({produto: unidades});
  //   }
  //   count = 0;
  //   mapPedido.forEach((key, value) {
  //     productsDetail.add('${key.nome} - qtde: ${value}\n');
  //     // print('${key.nome} - qtde: $value - valor: R\$ ${key.valor}\nTotal: R\$ ${key.valor * value}');
  //   });
  // index = 0;
  // qtde++;
  // }
  // print(
  //     '\nTotal de pedidos: $qtde\nTotal Comprado: R\$ $totalCliente\nEndereço de entrega: ${clienteSelecionado.endereco}\n');
  // count++;
  // totalSales += totalPorCliente;
  // }
  // index = 0;

  // count = 0;
  // print('Total de pedidos: ${pedidos.length}\nTotal de vendas: R\$ $totalVendasGeral');
  // formatarRelatorio(Formatacao.separacao, '-', null);
  // menu();
  // }

  // deliveryDetail(Cliente cliente) {
  //   var index = 0;
  //   cliente.produtos.forEach((element) {
  //     var totalProduct = element.valor * order.quantidades[index];
  //     productsDetail.add(
  //         '\n${element.nome} - qtde: ${order.quantidades[index]} - Valor: R\$ ${element.valor.currencyFormat(element.valor)}\nTotal: R\$ ${totalProduct.currencyFormat(totalProduct)}\n');

  //     totalOrder += element.valor * order.quantidades[index];
  //     index++;
  //   });
  // }

  // convetToList2(Pedido pedido) {
  //   clientName = pedido.cliente.nome;
  //   clientId = pedido.cliente.id;
  //   clientEndereco = pedido.cliente.endereco;
  //   atendentName = pedido.atendente.nome;
  //   idOrder = pedido.id;
  //   itemCount = mock.pedidos.length;
  // }


// class TicketReport extends SalesReport {}

  // listProductsDetail(Pedido pedido) {
  //   Map<String, int> teste = {};
  //   // for (var produto in mock.produtos) {
  //   var index = 0;
  //   var qtde = 0;
  //   for (var produto in pedido.produtos) {
  //     if (teste.containsKey(produto.nome)) {
  //       teste.update(produto.nome, (value) => value += pedido.quantidades[index]);
  //       index++;
  //     } else {
  //       teste.addAll({produto.nome: pedido.quantidades[index]});
  //       index++;
  //     }
  //   }
  //   teste.forEach((key, value) {
  //     productsDetail.add('\n${key} - qtde: ${value} - Valor: R\$ ${'fhos'}\nTotal: ${'element.valor * value'}\n');
  //   });