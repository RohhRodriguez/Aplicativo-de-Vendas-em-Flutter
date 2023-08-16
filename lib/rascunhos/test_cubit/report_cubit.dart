import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';
import 'package:projeto_desafio_flutter/presentation/core/utils/extensions.dart';
import '../../../domain/models/produto.dart';
import '../../application/services/report_generic_service.dart';
part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  Mock mock = Mock();
  ReportCubit() : super(LoadingState());

// dentro de cada service/ um geral de relatorios
  totalReport(EReport eReport) {
    var t = 0.0;
    var tComission = 0.0;
    var tStock = 0.0;
    for (var pedidos in mock.pedidos) {
      var i = 0;
      for (var p in pedidos.produtos) {
        var comission = pedidos.atendente.comissao / 100 * p.valor * pedidos.quantidades[i];
        tComission += comission;
        t += p.valor * pedidos.quantidades[i];
        i++;
      }
    }
    for (var element in mock.estoques) {
      var tStockProduct = element.produto.valor * element.quantidade;
      tStock += tStockProduct;
    }
    switch (eReport) {
      case EReport.salesReport:
        return t;
      case EReport.commissionReport:
        return tComission;
      case EReport.stockReport:
        return tStock;
      case EReport.deliveryReport:
        return mock.pedidos.length.toDouble();
    }
  }

  relatorioVendas(int i, BuildContext context, String type) {
    var format = '.';
    List<String> textList = [];
    var totalGeral2 = 0.0;
    var total = 0.0;
    for (var element in mock.pedidos) {
      var index = 0;
      if (element == mock.pedidos[i]) {
        for (var p in element.produtos) {
          var vTotal = element.quantidades[index] * p.valor;
          textList.add(
              '\n* ${p.nome} . Qtd: ${element.quantidades[index]} . Un: R\$ ${p.valor.currencyFormat(p.valor)}\nTotal: R\$ ${vTotal.currencyFormat(vTotal)}\n');
          total += element.quantidades[index] * p.valor;
          index++;
        }
      }
      totalGeral2 += total;
    }
    switch (type) {
      case 'total':
        return total.currencyFormat(total);
      case 'format':
        return format;
      case 'textList':
        return textList;
      case 'totalGeral':
        return totalGeral2.currencyFormat(totalGeral2);
    }
  }

  relatorioComissoes(int i, BuildContext context, String type) {
    var index = 0;
    var totalVendasAtendente = 0.0;
    var totalComissoesAtendente = 0.0;
    List<String> productList = [];

    for (var pedido in mock.pedidos) {
      if (pedido.atendente != mock.atendentes[i]) {
        continue;
      }
      productList.add('........................................................................');
      productList.add('Cliente - ${pedido.cliente.nome} - Pedido nº.: ${pedido.id}\n');
      // productList.add('Cliente - ${pedido.cliente.nome}');
      for (var produto in pedido.produtos) {
        var unidades = pedido.quantidades[index];
        var vTotal = pedido.quantidades[index] * produto.valor;
        var comissionProduct = vTotal * pedido.atendente.comissao / 100;
        productList.add(
            '\n* ${produto.nome} . Qtd: ${pedido.quantidades[index]} . Un: R\$ ${produto.valor.currencyFormat(produto.valor)}\nTotal: R\$ ${vTotal.currencyFormat(vTotal)} - Comissão: ${comissionProduct.currencyFormat(comissionProduct)}\n');

        index++;
        var v = unidades * produto.valor;
        var c = unidades * produto.valor * pedido.atendente.comissao / 100;
        totalVendasAtendente += v;
        totalComissoesAtendente += c;
      }
      index = 0;
    }
    switch (type) {
      case 'totalC':
        return totalComissoesAtendente.currencyFormat(totalComissoesAtendente);
      case 'totalA':
        return totalVendasAtendente.currencyFormat(totalVendasAtendente);
      case 'productList':
        return productList;
    }
  }

  relatorioEstoque() {
    var totalEstoques = 0.0;
    for (var element in mock.estoques) {
      totalEstoques += element.produto.valor * element.quantidade;
    }
    return totalEstoques.currencyFormat(totalEstoques);
  }

  relatorioEntregas(int i, BuildContext context, String type) {
    var count = 0;
    var totalVendasGeral = 0.0;
    var productList = [];
    // if (pedidos.isEmpty) {
    //   msgErro(MsgErro.nenhumaVenda);
    //   return;
    // }
    for (var cliente in mock.clientes) {
      var clienteSelecionado = mock.atendentes[i];
      var index = 0;
      var totalCliente = 0.0;
      var qtde = 0;
      Map<Produto, int> mapPedido = {};
      for (var pedido in mock.pedidos) {
        productList.add('........................................................................');
        productList.add('Cliente - ${pedido.cliente.nome} - Pedido nº.: ${pedido.id}\n');
        if (pedido.cliente != clienteSelecionado) {
          continue;
        }
        for (var produto in pedido.produtos) {
          var unidades = pedido.quantidades[index];
          index++;
          var v = unidades * produto.valor;
          totalCliente += v;
          mapPedido.isEmpty
              ? mapPedido.addAll({produto: unidades})
              : mapPedido.containsKey(produto)
                  ? mapPedido.update(produto, (value) => value += unidades)
                  : mapPedido.addAll({produto: unidades});
        }
        index = 0;
        qtde++;
      }
      mapPedido.forEach((key, value) {
        var vTotal = key.valor * value;
        productList.add(
            '\n* ${key.nome} . Qtd: $value . Un: R\$ ${key.valor.currencyFormat(key.valor)}\nTotal: R\$ ${vTotal.currencyFormat(vTotal)}}\n');
        count++;
        totalVendasGeral += totalCliente;
      });
      count = 0;
    }
  }
}

// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);

//   void increment() => emit(state + 1);
// }