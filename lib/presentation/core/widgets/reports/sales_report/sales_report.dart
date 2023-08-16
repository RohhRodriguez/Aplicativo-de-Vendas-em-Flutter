import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../application/cubit/reports/sales_report/sales_report_cubit.dart';

class SalesReport extends StatelessWidget {
  final formatter = NumberFormat("#,###.00", "pt_BR");

  SalesReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Relatório de Vendas';

    return BlocProvider<SalesReportCubit>(
      create: (BuildContext context) => SalesReportCubit()..generateSalesReport(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black87, title: const Text(title)),
        body: BlocBuilder<SalesReportCubit, SalesReportState>(builder: (context, state) {
          if (state is SuccessSalesReportData) {
            return Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                  itemCount: state.listSalesReport.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute<void>(
                      //       builder: (BuildContext context) => SalesDetail(
                      //           atendente: state.listSalesReport[0].listaAtendentes[i],
                      //           totalVendasAtendente: state.listSalesReport[0].listaTotalVendidoAtendente[i],
                      //           totalComissaoAtendente: state.listSalesReport[0].listaComissaoAtendente[i]),
                      //     ),
                      //   );
                      // },
                      child: ListTile(
                        title: Row(
                          children: [
                            // Text('Atendente: ${state.listSalesReport[0].listaAtendentes[i].nome}',
                            //     style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            // const Spacer(flex: 1),
                            // Text(
                            //   'R\$ ${formatter.format(state.listSalesReport[0].listaComissaoAtendente[i])}',
                            //   style: const TextStyle(fontWeight: FontWeight.bold),
                            // ),
                            const Icon(Icons.monetization_on, color: Colors.green)
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text('Comissão: ${state.listSalesReport[0].listaAtendentes[i].comissao}%',
                            //     style: const TextStyle(fontSize: 16)),
                            // Text(
                            //     'Total Vendido: R\$ ${formatter.format(state.listSalesReport[0].listaTotalVendidoAtendente[i])}',
                            //     style: const TextStyle(fontSize: 16)),
                            // Text(
                            //     'Id: ${state.listSalesReport[0].listaAtendentes[i].id}\n..................................................................................',
                            //     style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
        floatingActionButton: BlocBuilder<SalesReportCubit, SalesReportState>(builder: (context, state) {
          if (state is SuccessSalesReportData) {
            return Container(
              color: Colors.green,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Total de Comissões: R\$ ${formatter.format(state.totalSales)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            );
          }
          return Center(child: Container());
        }),
      ),
    );
  }
}
