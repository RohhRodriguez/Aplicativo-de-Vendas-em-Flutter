// import 'package:flutter/material.dart';

// class DeliveryReport extends StatelessWidget {
//   DeliveryReport({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const title = 'Relatório de Entregas';

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: title,
//       home: Scaffold(
//           appBar: AppBar(backgroundColor: Colors.black87, title: const Text(title), actions: [
//             IconButton(icon: const Icon(Icons.arrow_back), tooltip: 'Voltar', onPressed: () => Navigator.pop(context)),
//           ]),
//           body: Container(
//             padding: const EdgeInsets.only(bottom: 50),
//             child: ListView.builder(
//                 itemCount: mock.clientes.length,
//                 itemBuilder: (context, i) {
//                   ticketReport.relatorioEntregas();
//                   // salesReport.convetToList2(mock.pedidos[i]);
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute<void>(
//                           builder: (BuildContext context) => DeliveryDetail(
//                             client: mock.clientes[i], productsDetail: salesReport.productsDetail,
//                             // pedido: ,
//                             // totalProduct: reportCubit.relatorioVendas(i, context, 'total'), totalOrder: '',
//                           ),
//                         ),
//                       );
//                     },
//                     child: ListTile(
//                       title: Row(
//                         children: [
//                           Text('Cliente: ${salesReport.clientName}',
//                               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                           const Spacer(flex: 1),
//                           Text(
//                             'R\$ ${formatter.format(salesReport.totalPorCliente)}',
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           const Icon(Icons.monetization_on, color: Colors.green)
//                         ],
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Endereço: ${salesReport.clientEndereco}', style: const TextStyle(fontSize: 16)),
//                           Text('Cliente nº: ${salesReport.clientId}\n${salesReport.divisorReport}'),
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
//               'Total de Entregas: ${salesReport.itemCount}',
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           )),
//     );
//   }
// }
