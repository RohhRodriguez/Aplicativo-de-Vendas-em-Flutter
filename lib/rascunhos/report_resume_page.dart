// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../../application/services/report_generic_service.dart';

// final formatter = NumberFormat("#,###.00", "pt_BR");

// class GenericReport extends StatelessWidget {
//   final ReportGenerate reportGenerate;
//   final formatter = NumberFormat("#,###.00", "pt_BR");
//   final List<dynamic> totalList;
//   final List<String> itemName;
//   final List<String> detailInfo;
//   final List<String> totalByItem;
//   final String titleReport;

//   GenericReport({
//     Key? key,
//     required this.reportGenerate,
//     required this.totalList,
//     required this.itemName,
//     required this.detailInfo,
//     required this.totalByItem,
//     required this.titleReport,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: titleReport,
//       home: Scaffold(
//           appBar: AppBar(backgroundColor: Colors.black87, title: Text(titleReport), actions: [
//             IconButton(icon: const Icon(Icons.arrow_back), tooltip: 'Voltar', onPressed: () => Navigator.pop(context)),
//           ]),
//           body: Container(
//             padding: const EdgeInsets.only(bottom: 50),
//             child: ListView.builder(
//                 itemCount: totalList.length,
//                 itemBuilder: (context, i) {
//                   return InkWell(
//                     // onTap: () {
//                     //   Navigator.push(
//                     //       context,
//                     //       MaterialPageRoute<void>(
//                     //         builder: (BuildContext context) => OrderSale(
//                     //             pedido: mock.pedidos[i], totalOrder: formatter.format(salesReport.totalOrder)),
//                     //       ));
//                     // },
//                     child: ListTile(
//                       title: Row(
//                         children: [
//                           Text('${itemName[i]}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                           const Spacer(flex: 1),
//                           Text(
//                             'R\$ ${totalByItem[i]}',
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           const Icon(Icons.monetization_on, color: Colors.green)
//                         ],
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Text('Atendente: ${salesReport.atendentName}', style: const TextStyle(fontSize: 16)),
//                           Text('${detailInfo[i]}\n...............................................'), //divisorReport
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//           ),
//           floatingActionButton: Container(
//             color: Colors.green,
//             padding: const EdgeInsets.all(10),
//             child: Text(
//               // 'Total de Vendas: R\$ ${formatter.format(reportService.totalReport(EReport.salesReport))}',
//               'Total de Vendas: R\$ ${formatter.format(0.0000)}',
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           )),
//     );
//   }
// }
