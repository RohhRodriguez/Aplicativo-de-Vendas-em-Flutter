import 'package:intl/intl.dart';
import 'package:projeto_desafio_flutter/domain/models/pedido.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';
import '../../../../domain/models/atendente.dart';
import '../../../../domain/models/produto.dart';
import '../../../../domain/models/reports/comission_report/comission_report.dart';
import '../../../../domain/models/reports/comission_report/i_comission_report_repository.dart';

class ComissionReportRepository implements IComissionReportRepository {
  final formatter = NumberFormat("#,##0.00", "pt_BR");
  Mock mock = Mock();

  @override
  List<ComissionReport> getAllReports() {
    List<ComissionReport> listComissionReport = [];
    double totalPedido = 0.0;
    Map<Produto, int> mapProdutosPorPedido = {};
    List<double> listValorTotalProduto = [];
    List<String> listDetailReportPorPedido = [];
    List<String> listDetailReportPorAtendente = [];
    double comissaoTotalAtendente = 0.0;
    for (var atendente in mock.atendentes) {
      for (var pedido in mock.pedidos) {
        if (atendente != pedido.atendente) {
          continue;
        }
        int i = 0;
        for (var produto in pedido.produtos) {
          int quantidade = pedido.quantidades[i];
          double valorProduto = produto.valor * quantidade;
          double comissao = valorProduto * atendente.comissao / 100;
          totalPedido += valorProduto;
          comissaoTotalAtendente += comissao;
          mapProdutosPorPedido.addAll({produto: quantidade});
          listValorTotalProduto.add(produto.valor * quantidade);
          i++;
        }
      }
      listComissionReport.add(ComissionReport(
          atendente: atendente, comissaoAtendente: comissaoTotalAtendente, totalVendidoAtendente: totalPedido));
      comissaoTotalAtendente = 0.0;
      totalPedido = 0.0;
    }
    listDetailReportPorAtendente.add('$listDetailReportPorPedido');

    return listComissionReport;
  }

  @override
  double getTotalComissionReport() {
    double totalComissaoAtendente = 0.0;
    var t = getAllReports();
    t.forEach((element) {
      totalComissaoAtendente += element.comissaoAtendente;
    });
    return totalComissaoAtendente;
  }

  double getTotalVendidoAtendenteReport() {
    double totalVendidoAtendente = 0.0;
    var t = getAllReports();
    t.forEach((element) {
      totalVendidoAtendente += element.totalVendidoAtendente;
    });
    return totalVendidoAtendente;
  }

  List<Pedido> getDetailOrderReportComission(Atendente atendente) {
    List<Pedido> pedidos = [];
    for (var element in mock.pedidos) {
      if (element.atendente.id == atendente.id) {
        pedidos.add(element);
      }
    }
    return pedidos;
  }
}
