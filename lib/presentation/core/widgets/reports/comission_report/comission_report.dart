import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projeto_desafio_flutter/presentation/core/widgets/reports/comission_report/comission_detail.dart';
import '../../../../../application/cubit/reports/comission_report/comission_report_cubit/comission_report_cubit.dart';
import '../../../../../application/cubit/reports/comission_report/comission_report_detail/comission_report_detail_cubit.dart';

class CommissionReport extends StatelessWidget {
  final formatter = NumberFormat("#,###.00", "pt_BR");

  CommissionReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Relatório de Comissões';

    return BlocProvider<ComissionReportCubit>(
      create: (BuildContext context) => ComissionReportCubit()..generateComissionReport(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black87, title: const Text(title)),
        body: BlocBuilder<ComissionReportCubit, ComissionReportState>(builder: (context, state) {
          if (state is SuccessComissionReportData) {
            return Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                  itemCount: state.listComissionReport.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => BlocProvider<ComissionReportDetailCubit>(
                              create: (BuildContext context) => ComissionReportDetailCubit()
                                ..generateDetailComissionReport(state.listComissionReport[i].atendente),
                              child: ComissionDetail(
                                atendente: state.listComissionReport[i].atendente,
                              ),
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Text('Atendente: ${state.listComissionReport[i].atendente.nome}',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const Spacer(flex: 1),
                            Text(
                              'R\$ ${formatter.format(state.listComissionReport[i].comissaoAtendente)}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.monetization_on, color: Colors.green)
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Comissão: ${state.listComissionReport[i].atendente.comissao}%',
                                style: const TextStyle(fontSize: 16)),
                            Text(
                                'Total Vendido: R\$ ${formatter.format(state.listComissionReport[i].totalVendidoAtendente)}',
                                style: const TextStyle(fontSize: 16)),
                            Text(
                                'Id: ${state.listComissionReport[i].atendente.id}\n..................................................................................',
                                style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
        floatingActionButton: BlocBuilder<ComissionReportCubit, ComissionReportState>(builder: (context, state) {
          if (state is SuccessComissionReportData) {
            return Container(
              color: Colors.green,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Total de Comissões: R\$ ${formatter.format(state.totalComission)}',
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
