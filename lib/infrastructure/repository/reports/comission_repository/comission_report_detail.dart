import '../../../../domain/models/atendente.dart';
import '../../../../domain/models/comission_detail_report.dart';
import '../../../../domain/models/pedido.dart';
import '../../../../domain/models/produto.dart';
import '../../../../domain/models/reports/comission_report/i_comission_report_repository.dart';
import '../../../data.dart';

class ComissionReportDetailRepository implements IComissionDetailReportRepository {
  Mock mock = Mock();

  @override
  double getTotalSoldReport() {
    throw UnimplementedError();
  }

  @override
  List<ComissionReportDetail> getAllProducts(Atendente atendente) {
    List<Produto> listProducts = [];
    List<int> listQuantidades = [];
    List<double> listTotalProdutos = [];
    List<Pedido> pedidosCliente = [];
    List<ComissionReportDetail> listDetailsByClient = [];
    Map<Produto, int> mapProdutosPorPedido = {};
    double totalPedido = 0.0;
    double comissaoTotalPedido = 0.0;
    int i = 0;
    for (var pedido in mock.pedidos) {
      if (atendente != pedido.atendente) {
        continue;
      }
      for (var produto in pedido.produtos) {
        int quantidade = pedido.quantidades[i];
        double valorProduto = produto.valor * quantidade;
        double comissao = valorProduto * atendente.comissao / 100;
        totalPedido += valorProduto;
        comissaoTotalPedido += comissao;
        mapProdutosPorPedido.addAll({produto: quantidade});
        listTotalProdutos.add(valorProduto);
      }
      pedidosCliente.add(pedido);
      mapProdutosPorPedido.forEach((key, value) {
        listProducts.add(key);
        listQuantidades.add(value);
      });
      listDetailsByClient.add(ComissionReportDetail(
          pedido: pedido,
          listValorTotalProduto: listTotalProdutos,
          listaProdutosPorPedido: listProducts,
          quantidadeProdutosPorPedido: listQuantidades));
    }
    listDetailsByClient.forEach((element) {
      element.listaProdutosPorPedido.forEach((p) {
        print(p);
      });
      element.listValorTotalProduto.forEach((t) {
        print(t);
      });
      element.quantidadeProdutosPorPedido.forEach((q) {
        print(q);
      });
    });
    return listDetailsByClient;
  }

  @override
  double getTotalComissionReport() {
    // TODO: implement getTotalComissionReport
    throw UnimplementedError();
  }
}
