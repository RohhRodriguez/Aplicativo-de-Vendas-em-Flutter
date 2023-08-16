// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:projeto_desafio_flutter/application/cubit/reports/stock_report/stock_report_cubit.dart';
// import '../../../../../application/cubit/reports/comission_report/comission_report_cubit/comission_report_cubit.dart';

// class StockReport extends StatelessWidget {
//   final formatter = NumberFormat("#,###.00", "pt_BR");

//   StockReport({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const title = 'Relatório de Estoques';

//     return BlocProvider<ComissionReportCubit>(
//       create: (BuildContext context) => ComissionReportCubit()..generateComissionReport(),
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: Colors.black87, title: const Text(title)),
//         body: BlocBuilder<StockReportCubit, StockReportState>(builder: (context, state) {
//           if (state is SuccessStockReportData) {
//             return Container(
//               padding: const EdgeInsets.only(bottom: 50),
//               child: ListView.builder(
//                   itemCount: state.listStockReport.length,
//                   itemBuilder: (context, i) {
//                     return InkWell(
//                       // onTap: () {
//                       //   Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute<void>(
//                       //       builder: (BuildContext context) => StockDetail(
//                       //           atendente: state.listStockReport[0].listaAtendentes[i],
//                       //           totalVendasAtendente: state.listStockReport[0].listaTotalVendidoAtendente[i],
//                       //           totalComissaoAtendente: state.listStockReport[0].listaComissaoAtendente[i]),
//                       //     ),
//                       //   );
//                       // },
//                       child: ListTile(
//                         title: Row(
//                           children: [
//                             Text('${state.listStockReport[0].listaAtendentes[i].nome}',
//                                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                             const Spacer(flex: 1),
//                             Text(
//                               'R\$ ${formatter.format(state.listStockReport[0].listaComissaoAtendente[i])}',
//                               style: const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             const Icon(Icons.monetization_on, color: Colors.green)
//                           ],
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Comissão: ${state.listStockReport[0].listaAtendentes[i].comissao}%',
//                                 style: const TextStyle(fontSize: 16)),
//                             Text(
//                                 'Total Vendido: R\$ ${formatter.format(state.listStockReport[0].listaTotalVendidoAtendente[i])}',
//                                 style: const TextStyle(fontSize: 16)),
//                             Text(
//                                 'Id: ${state.listStockReport[0].listaAtendentes[i].id}\n..................................................................................',
//                                 style: const TextStyle(fontSize: 16)),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             );
//           }
//           return const Center(child: CircularProgressIndicator());
//         }),
//         floatingActionButton: BlocBuilder<StockReportCubit, StockReportState>(builder: (context, state) {
//           if (state is SuccessStockReportData) {
//             return Container(
//               color: Colors.green,
//               padding: const EdgeInsets.all(10),
//               child: Text(
//                 'Total de Comissões: R\$ ${formatter.format(state.totalStock)}',
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//             );
//           }
//           return Center(child: Container());
//         }),
//       ),
//     );
//   }
// }
