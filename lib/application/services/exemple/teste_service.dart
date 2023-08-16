  // List<String> convertToList(EReport eReport, String item) {
  //   Map<String, String> listbyClients = {};
  //   Map<String, String> listbyProdutos = {};
  //   Map<String, String> listbyAtendents = {};
  //   Map<String, String> listbyPedidos = {};
  //   List<String> totalByPedido = [];
  //   List<String> totalSalesByCliente = [];
  //   List<String> totalComissionByAtendente = [];
  //   double totalPedido = 0.0;
  //   mock.pedidos.forEach((pedido) {
  //     int i = 0;
  //     pedido.produtos.forEach((produto) {
  //       var totalProduto = produto.valor * pedido.quantidades[i];
  //       totalPedido += totalProduto;
  //       i++;
  //     });
  //     totalByPedido.add('${formatter.format(totalPedido)}');

  //     // var salesByCliente = totalByCliente(pedido.cliente);
  //     // listbyClients
  //     //     .addAll({'Cliente: ${pedido.cliente.nome}': 'Endereço: ${pedido.cliente.endereco}\nPedido nº: ${pedido.id}'});
  //     // totalSalesByCliente.add('${formatter.format(salesByCliente)}');

  //     listbyPedidos.addAll({
  //       'Pedido: ${mock.pedidos.indexOf(pedido) + 1}':
  //           'Cliente: ${pedido.cliente.nome}\nAtendente: ${pedido.atendente.nome}\nPedido nº: ${pedido.id}'
  //     });
  //   });
  //   List<String> totalByEstoque = [];
  //   mock.estoques.forEach((estoque) {
  //     listbyProdutos.addAll({
  //       '${estoque.produto.nome}':
  //           'Valor: ${formatter.format(estoque.produto.valor)} . Qtde: ${estoque.quantidade} . Total: R\$ ${formatter.format(estoque.produto.valor * estoque.quantidade)}\nId: ${estoque.produto.id}'
  //     });
  //     totalByEstoque.add('${formatter.format(estoque.produto.valor * estoque.quantidade)}');
  //   });
  //   if (eReport == EReport.salesReport) {
  //     if (item == 'title') {
  //       return listbyPedidos.keys.toList();
  //     }
  //     // else if (item == 'total') {
  //     //   return totalByPedido;
  //     // }
  //     return listbyPedidos.values.toList();
  //   } else if (eReport == EReport.commissionReport) {
  //     if (item == 'title') {
  //       return listbyAtendents.keys.toList();
  //     }
  //     // else if (item == 'total') {
  //     //   return totalComissionByAtendente;
  //     // }
  //     return listbyAtendents.values.toList();
  //   } else if (eReport == EReport.stockReport) {
  //     if (item == 'title') {
  //       return listbyProdutos.keys.toList();
  //     }
  //     // else if (item == 'total') {
  //     //   return totalByEstoque;
  //     // }
  //     return listbyProdutos.values.toList();
  //   } else {
  //     if (item == 'title') {
  //       return listbyClients.keys.toList();
  //     }
  //     // else if (item == 'total') {
  //     //   return totalByEstoque;
  //     // }
  //     return listbyClients.values.toList();
  //   }
  // }

  // var i = 0;
  // mock.pedidos[i].cliente.nome;
  // String clientName = mock.pedidos[i].cliente.nome;
  // String clientId = mock.pedidos[i].cliente.id;
  // String clientEndereco = mock.pedidos[i].cliente.endereco;
  // String atendentName = mock.pedidos[i].atendente.nome;
  // String idOrder = mock.pedidos[i].id;
  // // var itemCount = mock.pedidos.length;
  // // var productsOrder = {};
  // // var totalOrder = 0.0;

  // // var index = 0;
  // // for (var p in mock.pedidos[i].produtos) {
  // //   totalOrder += mock.pedidos[i].quantidades[index] * p.valor;
  // //   index++;
  // // }
  // switch (eReport) {
  //     case EReport.salesReport:
  //     return clientName;
  //       // return totalSales;
  //     case EReport.commissionReport:
  //     return
  //       // return totalComission;
  //     case EReport.stockReport:
  //       // return totalStock;
  //     case EReport.deliveryReport:
  //       // return mock.pedidos.length.toDouble();
  //   }
  // }

  // convertToList(int i) {
  //   clientName = mock.pedidos[i].cliente.nome;
  //   clientId = mock.pedidos[i].cliente.id;
  //   clientEndereco = mock.pedidos[i].cliente.endereco;
  //   atendentName = mock.pedidos[i].atendente.nome;
  //   idOrder = mock.pedidos[i].id;
  //   itemCount = mock.pedidos.length;
  //   productsOrder = {};
  //   totalOrder = 0.0;

  //   var index = 0;
  //   for (var p in mock.pedidos[i].produtos) {
  //     totalOrder += mock.pedidos[i].quantidades[index] * p.valor;
  //     index++;
  //   }
  // }
  //////////////////////////////////////////////////////////////////////////////
    // double comissionByAtendent() {
  //   mock.atendentes.forEach((atendente) {
  //     atendente.
  //   });
  //   comissionByAtendent(mock.pedido.atendente).forEach((key, value) {
  //     // final salesByAtendente = comissionByAtendent(pedido.atendente);
  //     var comissionValue = value;
  //     var valor = key;
  //     // print('${key}, ${value}');
  //     listbyAtendents.addAll({
  //       'Atendente: ${pedido.atendente.nome}':
  //           'Comissão: ${pedido.atendente.comissao}%\nTotal de vendido: R\$ ${formatter.format(key)}\nTotal: R\$ ${value}\nId: ${pedido.atendente.id}R\$ ${value}'
  //     });
  //     totalComissionByAtendente.add('${value}');
  //   });
  // }
  //////////////////////////////////////////////////////////////////////
  
  // List<String> convertToList2(EReport eReport, String item) {
  //   Map<String, String> listbyClients = {};
  //   Map<String, String> listbyProdutos = {};
  //   Map<String, String> listbyAtendents = {};
  //   Map<String, String> listbyPedidos = {};
  //   List<String> totalByPedido = [];
  //   List<String> totalSalesByCliente = [];
  //   List<String> totalComissionByAtendente = [];
  //   double totalPedido = 0.0;
  //   mock.pedidos.forEach((pedido) {
  //     int i = 0;
  //     pedido.produtos.forEach((produto) {
  //       var totalProduto = produto.valor * pedido.quantidades[i];
  //       totalPedido += totalProduto;
  //       i++;
  //     });
  //     totalByPedido.add('${formatter.format(totalPedido)}');

  //     // var salesByCliente = totalByCliente(pedido.cliente);
  //     // listbyClients
  //     //     .addAll({'Cliente: ${pedido.cliente.nome}': 'Endereço: ${pedido.cliente.endereco}\nPedido nº: ${pedido.id}'});
  //     // totalSalesByCliente.add('${formatter.format(salesByCliente)}');

  //     listbyPedidos.addAll({
  //       'Pedido: ${mock.pedidos.indexOf(pedido) + 1}':
  //           'Cliente: ${pedido.cliente.nome}\nAtendente: ${pedido.atendente.nome}\nPedido nº: ${pedido.id}'
  //     });
  //   });
  //   List<String> totalByEstoque = [];
  //   mock.estoques.forEach((estoque) {
  //     listbyProdutos.addAll({
  //       '${estoque.produto.nome}':
  //           'Valor: ${formatter.format(estoque.produto.valor)} . Qtde: ${estoque.quantidade} . Total: R\$ ${formatter.format(estoque.produto.valor * estoque.quantidade)}\nId: ${estoque.produto.id}'
  //     });
  //     totalByEstoque.add('${formatter.format(estoque.produto.valor * estoque.quantidade)}');
  //   });
  //   if (eReport == EReport.salesReport) {
  //     if (item == 'title') {
  //       return listbyPedidos.keys.toList();
  //     } else if (item == 'total') {
  //       return totalByPedido;
  //     }
  //     return listbyPedidos.values.toList();
  //   } else if (eReport == EReport.commissionReport) {
  //     if (item == 'title') {
  //       return listbyAtendents.keys.toList();
  //     } else if (item == 'total') {
  //       return totalComissionByAtendente;
  //     }
  //     return listbyAtendents.values.toList();
  //   } else if (eReport == EReport.stockReport) {
  //     if (item == 'title') {
  //       return listbyProdutos.keys.toList();
  //     } else if (item == 'total') {
  //       return totalByEstoque;
  //     }
  //     return listbyProdutos.values.toList();
  //   } else {
  //     if (item == 'title') {
  //       return listbyClients.keys.toList();
  //     } else if (item == 'total') {
  //       return totalByEstoque;
  //     }
  //     return listbyClients.values.toList();
  //   }
  // }
  /////////////////////////////////////////////
  // List<String> comissionByAtendent2(EReport eReport, String type) {
  //   // var count = 0;
  //   // var totalComissoesGeral = 0.0;
  //   // var totalVendasGeral = 0.0;
  //   List<String> listComissoes = [];
  //   Map<Atendente, double> mapComissoes = {};
  //   var index = 0;
  //   var totalVendasAtendente = 0.0;
  //   var totalComissoesAtendente = 0.0;

  //   for (var pedido in mock.pedidos) {
  //     mapComissoes.addAll({pedido.atendente: totalVendasAtendente});
  //     if (pedido.atendente != mock.atendentes[index]) {
  //       continue;
  //     }
  //     for (var produto in pedido.produtos) {
  //       var unidades = pedido.quantidades[index];
  //       index++;
  //       var v = unidades * produto.valor;
  //       var c = unidades * produto.valor * pedido.atendente.comissao / 100;
  //       totalVendasAtendente += v;
  //       totalComissoesAtendente += c;
  //       // listComissoes.add('${totalVendasAtendente * totalComissoesAtendente / 100}');
  //     }
  //     index = 0;
  //   }
  //   List<String> listbyClients = [];
  //   Map<String, String> listDetails = {};
  //   mapComissoes.forEach((key, value) {
  //     // listComissoes.add('${totalVendasAtendente * totalComissoesAtendente / 100}');
  //     listDetails.addAll({
  //       'Atendente: ${key.nome}':
  //           'Comissão: ${key.comissao}%\nTotal vendido: R\$ ${formatter.format(value)}\nComissão total: R\$ ${formatter.format(value * key.comissao / 100)}\nPedido nº: ${key.id}'
  //     });
  //     listComissoes.add('${formatter.format(value * key.comissao / 100)}');
  //     // totalSalesByCliente.add('${formatter.format(salesByCliente)}');
  //   });

  //   // listComissoes.add('${totalVendasAtendente * totalComissoesAtendente}');
  //   // count = 0;
  //   // mapComissoes.addAll({'${totalVendasAtendente}': '${totalVendasAtendente * totalComissoesAtendente}'});
  //   // index = 0;
  //   switch (type) {
  //     case 'nomeAtendente':
  //       return listDetails.keys.toList();
  //     case 'comissoesAtendente':
  //       return listComissoes;
  //     case 'detail':
  //       return listDetails.values.toList();
  //     case 'totalGeral':
  //       return listDetails.values.toList();
  //   }
  //   return listComissoes;
  // }
  ///////////////////////////////////////////////////
  // Map<double, double> comissionByAtendent23(Atendente atendente) {
  //   var count = 0;
  //   var totalComissoesGeral = 0.0;
  //   var totalVendasGeral = 0.0;
  //   Map<double, double> mapComissoes = {};
  //   var index = 0;
  //   var totalVendasAtendente = 0.0;
  //   var totalComissoesAtendente = 0.0;
  //   for (var pedido in mock.pedidos) {
  //     if (pedido.atendente != atendente) {
  //       continue;
  //     }
  //     // print('Pedido nº: ${element.id}');
  //     for (var produto in pedido.produtos) {
  //       var unidades = pedido.quantidades[index];
  //       // print(
  //       //     'produto: ${produto.nome} - preço: R\$ ${produto.valor} - qtde: $unidades - valor total: R\$ ${unidades * produto.valor} - %comissão: ${element.atendente.comissao}% - comissão: R\$ ${unidades * produto.valor * element.atendente.comissao / 100}');
  //       index++;
  //       var v = unidades * produto.valor;
  //       var c = unidades * produto.valor * pedido.atendente.comissao / 100;
  //       totalVendasAtendente += v;
  //       // listComissionByAtendente.add(totalComissoesAtendente);
  //       // listSalesByAtendente.add(totalVendasAtendente);
  //       totalComissoesAtendente += c;
  //       // mapComissoes.addAll({totalVendasAtendente: totalComissoesAtendente});
  //     }
  //     // }
  //     // mapComissoes.addAll({totalVendasAtendente: totalVendasAtendente * atendente.comissao / 100});
  //     index = 0;
  //   }
  //   count = 0;
  //   mapComissoes.addAll({totalVendasAtendente: totalVendasAtendente * atendente.comissao / 100});
  //   index = 0;
  //   // count = 0;
  //   mapComissoes.forEach((key, value) {
  //     // print('${key}, ${value}');
  //   });
  //   return mapComissoes;
  // }
  ///////////////////////////////////////////////
  // class TicketReport {
  // Mock mock = Mock();
  // ////////////////////////////////////////
  // void gerarTicketEntrega() {
  //   mock.pedidos.isEmpty
  //       ?
  //       // ? msgErro(MsgErro.nenhumaVenda)
  //       print('erro')
  //       : print('Informe para qual pedido deseja gerar o ticket para entrega:');
  //   for (var element in mock.pedidos) {
  //     print(
  //         '${mock.pedidos.indexOf(element)} => id do pedido: ${element.id} - nome do cliente: ${element.cliente.nome}');
  //   }
  //   try {
  //     // ticketEntrega(mock.pedidos[int.parse(stdin.readLineSync()!)]);
  //   } catch (e) {
  //     print('Valor digitado é inválido!');
  //     gerarTicketEntrega();
  //   }
  // }

  // void ticketEntrega(Pedido pedido) {
  //   var index = 0;
  //   var totalPedido = 0.0;
  //   print('id do cliente: ${pedido.cliente.id}');
  //   for (var element in pedido.produtos) {
  //     var unidades = pedido.quantidades[index];
  //     print(
  //         'Produto: ${element.nome} - qtde: $unidades - valor: R\$ ${element.valor} - total: R\$ ${unidades * element.valor}');
  //     index++;
  //     var v = unidades * element.valor;
  //     totalPedido += v;
  //   }
  //   print(
  //       'total do pedido: R\$ $totalPedido\n\nNOME DO CLIENTE: ${pedido.cliente.nome.toUpperCase()}\nENDEREÇO DE ENTREGA: ${pedido.cliente.endereco.toUpperCase()}\n\nTicket nº.: ${mock.pedidos.last.id}');
  //   index = 0;
  // }
  ////////////////////////////////////////////////////////
//   class TicketReport {
//   Mock mock = Mock();
//   ////////////////////////////////////////
//   void gerarTicketEntrega() {
//     mock.pedidos.isEmpty
//         ?
//         // ? msgErro(MsgErro.nenhumaVenda)
//         print('erro')
//         : print('Informe para qual pedido deseja gerar o ticket para entrega:');
//     for (var element in mock.pedidos) {
//       print(
//           '${mock.pedidos.indexOf(element)} => id do pedido: ${element.id} - nome do cliente: ${element.cliente.nome}');
//     }
//     try {
//       // ticketEntrega(mock.pedidos[int.parse(stdin.readLineSync()!)]);
//     } catch (e) {
//       print('Valor digitado é inválido!');
//       gerarTicketEntrega();
//     }
//   }

//   void ticketEntrega(Pedido pedido) {
//     var index = 0;
//     var totalPedido = 0.0;
//     print('id do cliente: ${pedido.cliente.id}');
//     for (var element in pedido.produtos) {
//       var unidades = pedido.quantidades[index];
//       print(
//           'Produto: ${element.nome} - qtde: $unidades - valor: R\$ ${element.valor} - total: R\$ ${unidades * element.valor}');
//       index++;
//       var v = unidades * element.valor;
//       totalPedido += v;
//     }
//     print(
//         'total do pedido: R\$ $totalPedido\n\nNOME DO CLIENTE: ${pedido.cliente.nome.toUpperCase()}\nENDEREÇO DE ENTREGA: ${pedido.cliente.endereco.toUpperCase()}\n\nTicket nº.: ${mock.pedidos.last.id}');
//     index = 0;
//   }

// ////////////////////////////////////
//   void relatorioEntregas() {
//     var count = 0;
//     var totalVendasGeral = 0.0;
//     // if (pedidos.isEmpty) {
//     //   msgErro(MsgErro.nenhumaVenda);
//     //   return;
//     // }
//     for (var cliente in mock.clientes) {
//       var clienteSelecionado = mock.clientes[count];
//       print('Cliente: ${cliente.nome}\nid do cliente: ${cliente.id}');
//       var index = 0;
//       var totalCliente = 0.0;
//       var qtde = 0;
//       Map<Produto, int> mapPedido = {};
//       List listDetailProdutos = [];
//       for (var pedido in mock.pedidos) {
//         if (pedido.cliente != clienteSelecionado) {
//           continue;
//         }
//         for (var produto in pedido.produtos) {
//           var unidades = pedido.quantidades[index];
//           index++;
//           var v = unidades * produto.valor;
//           totalCliente += v;
//           mapPedido.isEmpty
//               ? mapPedido.addAll({produto: unidades})
//               : mapPedido.containsKey(produto)
//                   ? mapPedido.update(produto, (value) => value += unidades)
//                   : mapPedido.addAll({produto: unidades});
//         }
//         index = 0;
//         qtde++;
//       }
//       mapPedido.forEach((key, value) {
//         listDetailProdutos.add(
//             'produto: ${key.nome} - quantidade: $value - valor unidade: R\$ ${key.valor} - valor total: R\$ ${key.valor * value}');
//         print(
//             'produto: ${key.nome} - quantidade: $value - valor unidade: R\$ ${key.valor} - valor total: R\$ ${key.valor * value}');
//       });
//       // print(
//       //     '\nTotal de pedidos: $qtde\nTotal Comprado: R\$ $totalCliente\nEndereço de entrega: ${clienteSelecionado.endereco}\n');
//       count++;
//       totalVendasGeral += totalCliente;
//     }
//     count = 0;
//     // print('Total de pedidos: ${mock.pedidos.length}\nTotal de vendas: R\$ $totalVendasGeral');
//   }
// }
