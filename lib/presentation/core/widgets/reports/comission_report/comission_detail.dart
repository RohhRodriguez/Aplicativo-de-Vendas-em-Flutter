import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
import 'package:projeto_desafio_flutter/domain/models/pedido.dart';
import 'package:projeto_desafio_flutter/presentation/core/utils/extensions.dart';
import '../../../../../application/cubit/reports/comission_report/comission_report_detail/comission_report_detail_cubit.dart';

class ComissionDetail extends StatelessWidget {
  final formatter = NumberFormat("#,##0.00", "pt_BR");
  final Atendente atendente;
  ComissionDetail({
    Key? key,
    required this.atendente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87, title: Text(atendente.nome)),
      body: BlocBuilder<ComissionReportDetailCubit, ComissionReportDetailState>(builder: (context, state) {
        if (state is SuccessDetailComissionReportData) {
          return Container(
            padding: const EdgeInsets.only(bottom: 50),
            child: ListView.builder(
                itemCount: state.listaPedidos.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              'Pedido ${i + 1}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(flex: 1),
                            Text('R\$ ${valorTotalPedido(state.listaPedidos[i]).values.join()}',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const Icon(Icons.monetization_on, color: Colors.green)
                          ],
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('* ${state.listaPedidos[i].produtos.map((e) => e.nome).join('\n* ')}'),
                                  const Spacer(flex: 1),
                                  Text('qtde: ${state.listaPedidos[i].quantidades.asMap().values.join('\nqtde: ')}'),
                                  const Spacer(flex: 1),
                                  Text(
                                      'R\$ ${state.listaPedidos[i].produtos.map((e) => e.valor.currencyFormat(e.valor)).join('\nR\$ ')}'),
                                  const Spacer(flex: 1),
                                  Text('R\$ ${valorProduto(state.listaPedidos[i])}'),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Pedido: R\$ ${valorTotalPedido(state.listaPedidos[i]).keys.join()}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Id: ${state.listaPedidos[i].id}\n...............................................................................',
                                      style: const TextStyle(color: Colors.black, fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                }),
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
      floatingActionButton: BlocBuilder<ComissionReportDetailCubit, ComissionReportDetailState>(
        builder: (context, state) {
          if (state is SuccessDetailComissionReportData) {
            return Container(
              color: Colors.green,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Total de Comissões: R\$ ${formatter.format(state.totalComission)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  valorProduto(Pedido pedido) {
    List<double> total = [];
    int index = 0;
    for (var produto in pedido.produtos) {
      double totalProduto = produto.valor * pedido.quantidades[index];
      total.add(totalProduto);
      index++;
    }
    return total.map((e) => e.currencyFormat(e)).join('\nR\$ ');
  }

  Map<String, String> valorTotalPedido(Pedido pedido) {
    Map<String, String> totalPedido = {};
    int index = 0;
    var totalProdutoPedido = 0.0;
    var totalComissaoPedido = 0.0;
    for (var produto in pedido.produtos) {
      double totalProduto = produto.valor * pedido.quantidades[index];
      double totalComissao = totalProduto * pedido.atendente.comissao / 100;
      totalProdutoPedido += totalProduto;
      totalComissaoPedido += totalComissao;
      index++;
    }
    totalPedido.addAll({
      totalProdutoPedido.currencyFormat(totalProdutoPedido): totalComissaoPedido.currencyFormat(totalComissaoPedido)
    });
    return totalPedido;
  }
}
