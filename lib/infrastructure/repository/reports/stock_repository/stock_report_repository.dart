import 'package:intl/intl.dart';
import 'package:projeto_desafio_flutter/domain/models/pedido.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';
import '../../../../domain/models/atendente.dart';
import '../../../../domain/models/produto.dart';
import '../../../../domain/models/reports/comission_report/i_comission_report_repository.dart';
import '../../../../domain/models/reports/stock_report/i_stock_report_repository.dart';
import '../../../../domain/models/reports/stock_report/stock_report.dart';

class StockReportRepository implements IStockReportRepository {
  final formatter = NumberFormat("#,##0.00", "pt_BR");
  Mock mock = Mock();

  @override
  List<StockReport> getAllReports() {
    var totalEstoques = 0.0;
    for (var element in mock.estoques) {
      print(
          '${element.produto.nome} - valor: R\$ ${element.produto.valor} -  qtde: ${element.quantidade} - valor total: R\$ ${element.produto.valor * element.quantidade} - id: ${element.produto.id}');
      totalEstoques += element.produto.valor * element.quantidade;
    }

    print('Valor total: R\$ $totalEstoques');
    return [];
  }

  @override
  double getTotalStockReport() {
    // var t = getAllReports()[0].listaComissaoAtendente;
    // var totalComissao = t.reduce((value, element) => value + element);
    return 0.0;
  }

  List<Pedido> getDetailOrderReportStock(Atendente atendente) {
    List<Pedido> pedidos = [];
    for (var element in mock.pedidos) {
      if (element.atendente.nome == atendente.nome) {
        pedidos.add(element);
      }
    }
    return pedidos;
  }
}
