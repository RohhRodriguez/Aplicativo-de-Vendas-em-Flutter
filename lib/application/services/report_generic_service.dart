import 'package:intl/intl.dart';
import 'package:projeto_desafio_flutter/domain/models/cliente.dart';
import '../../domain/models/atendente.dart';
import '../../infrastructure/data.dart';
import 'package:flutter/material.dart';

enum EReport { salesReport, deliveryReport, stockReport, commissionReport }

class ReportGenerate {
  final EReport reportType;
  final Mock mock = Mock();
  final formatter = NumberFormat("#,###.00", "pt_BR");
  ReportGenerate._(this.reportType);

  factory ReportGenerate.salesReport() => ReportGenerate._(EReport.salesReport);
  factory ReportGenerate.commissionReport() => ReportGenerate._(EReport.commissionReport);
  factory ReportGenerate.stockReport() => ReportGenerate._(EReport.stockReport);
  factory ReportGenerate.deliveryReport() => ReportGenerate._(EReport.deliveryReport);

  double get total {
    return {
      EReport.salesReport: totalReport(EReport.salesReport),
      EReport.commissionReport: totalReport(EReport.commissionReport),
      EReport.stockReport: totalReport(EReport.stockReport),
      EReport.deliveryReport: totalReport(EReport.deliveryReport),
    }[reportType]!;
  }

  get listReport {
    return {
      EReport.salesReport: mock.pedidos,
      EReport.commissionReport: mock.atendentes,
      EReport.stockReport: mock.produtos,
      EReport.deliveryReport: mock.clientes,
    }[reportType]!;
  }

  get nameItemReport {
    return {
      // EReport.salesReport: comissionByAtendent('nomeAtendente'),
      EReport.commissionReport: comissionByAtendent('nomeAtendente'),
      // EReport.stockReport: comissionByAtendent('nomeAtendente'),
      // EReport.deliveryReport: comissionByAtendent('nomeAtendente'),
    }[reportType]!;
  }

  get detailItemReport {
    return {
      // EReport.salesReport: comissionByAtendent('nomeAtendente'),
      EReport.commissionReport: comissionByAtendent('detail'),
      // EReport.stockReport: comissionByAtendent('nomeAtendente'),
      // EReport.deliveryReport: comissionByAtendent('nomeAtendente'),
    }[reportType]!;
  }

  get valueItemReport {
    return {
      // EReport.salesReport: comissionByAtendent('comissoesAtendente'),
      EReport.commissionReport: comissionByAtendent('comissoesAtendente'),
      // EReport.stockReport: comissionByAtendent('comissoesAtendente'),
      // EReport.deliveryReport: comissionByAtendent('nomeAtendente'),
    }[reportType]!;
  }

  String get titleReport {
    return {
      EReport.salesReport: 'Relatório de Vendas',
      EReport.commissionReport: 'Relatório de Comissões',
      EReport.stockReport: 'Relatório de Estoques',
      EReport.deliveryReport: 'Relatório de Entregas',
    }[reportType]!;
  }

  IconData get icon {
    return {
      EReport.salesReport: Icons.bar_chart,
      EReport.deliveryReport: Icons.car_crash,
      EReport.stockReport: Icons.check_box,
      EReport.commissionReport: Icons.monetization_on,
    }[reportType]!;
  }

  String get reportEmpty {
    return {
      EReport.salesReport: 'Nenhuma venda foi registrada.',
      EReport.deliveryReport: 'Nenhuma entrega foi registrada.',
      EReport.stockReport: 'Nenhum produto em estoque.',
      EReport.commissionReport: 'Nenhuma venda foi registrada.',
    }[reportType]!;
  }

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

    try {
      switch (eReport) {
        case EReport.salesReport:
          return totalSales;
        case EReport.commissionReport:
          return totalComission;
        case EReport.stockReport:
          return totalStock;
        case EReport.deliveryReport:
          return mock.pedidos.length.toDouble();
      }
    } catch (e) {
      return 'Um erro ocorreu!';
    }
  }

  List<String> comissionByAtendent(String type) {
    // var count = 0;
    // var totalComissoesGeral = 0.0;
    // var totalVendasGeral = 0.0;
    List<String> listComissoes = [];
    Map<Atendente, double> mapComissoes = {};
    var index = 0;
    var totalVendasAtendente = 0.0;
    var totalComissoesAtendente = 0.0;

    for (var pedido in mock.pedidos) {
      mapComissoes.addAll({pedido.atendente: totalVendasAtendente});
      if (pedido.atendente != mock.atendentes[index]) {
        continue;
      }
      for (var produto in pedido.produtos) {
        var unidades = pedido.quantidades[index];
        index++;
        var v = unidades * produto.valor;
        var c = unidades * produto.valor * pedido.atendente.comissao / 100;
        totalVendasAtendente += v;
        totalComissoesAtendente += c;
        // listComissoes.add('${totalVendasAtendente * totalComissoesAtendente / 100}');
      }
      index = 0;
    }
    List<String> listbyClients = [];
    Map<String, String> listDetails = {};
    mapComissoes.forEach((key, value) {
      // listComissoes.add('${totalVendasAtendente * totalComissoesAtendente / 100}');
      listDetails.addAll({
        'Atendente: ${key.nome}':
            'Comissão: ${key.comissao}%\nTotal vendido: R\$ ${formatter.format(value)}\nComissão total: R\$ ${formatter.format(value * key.comissao / 100)}\nPedido nº: ${key.id}'
      });
      listComissoes.add('${formatter.format(value * key.comissao / 100)}');
      // totalSalesByCliente.add('${formatter.format(salesByCliente)}');
    });
    switch (type) {
      case 'nomeAtendente':
        return listDetails.keys.toList();
      case 'comissoesAtendente':
        return listComissoes;
      case 'detail':
        return listDetails.values.toList();
      case 'totalGeral':
        return listDetails.values.toList();
    }
    return listComissoes;
  }

  totalByCliente(EReport eReport, String type) {
    var count = 0;
    var totalComissoesGeral = 0.0;
    var totalVendasGeral = 0.0;
    var index = 0;
    var totalCompradoCliente = 0.0;
    Map<Cliente, double> mapClientes = {};
    Map<String, String> listDetails = {};
    // var totalComissoesAtendente = 0.0;
    for (var pedido in mock.pedidos) {
      if (pedido.cliente != mock.clientes[index]) {
        continue;
      }
      // print('Pedido nº: ${element.id}');
      var i = 0;
      mapClientes.addAll({pedido.cliente: totalCompradoCliente});
      for (var produto in pedido.produtos) {
        var unidades = pedido.quantidades[i];
        // print(
        //     'produto: ${produto.nome} - preço: R\$ ${produto.valor} - qtde: $unidades - valor total: R\$ ${unidades * produto.valor} - %comissão: ${element.atendente.comissao}% - comissão: R\$ ${unidades * produto.valor * element.atendente.comissao / 100}');
        var v = unidades * produto.valor;
        totalCompradoCliente += v;
        // List<String> listbyClients = [];
        index++;
      }
      i = 0;
      index++;
    }
    mapClientes.forEach((key, value) {
      print('$key - $value');
    });
    List<String> listSales = [];
    mapClientes.forEach((key, value) {
      listDetails.addAll({
        'Cliente: ${key.nome}':
            'Endereço: ${key.endereco}\nTotal comprado: R\$ ${formatter.format(value)}\nId: ${key.id}'
      });
      listSales.add('${formatter.format(value)}');
    });
    count = 0;
    switch (type) {
      case 'nomeItem':
        return listDetails.keys.toList();
      case 'totalItem':
        return listSales;
      case 'detail':
        return listDetails.values.toList();
      case 'totalGeral':
        return listDetails.values.toList();
    }
  }
}
