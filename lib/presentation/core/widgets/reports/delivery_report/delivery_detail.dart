// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../../../application/services/report_service.dart';
// import '../../../domain/models/cliente.dart';
// import '../../../domain/models/pedido.dart';

// class DeliveryDetail extends StatelessWidget {
//   // Pedido pedido;
//   // List<String> productList;
//   // String totalProduct;
//   SalesReport salesReport = SalesReport();
//   final formatter = NumberFormat("#,###.00", "pt_BR");
//   Cliente client;
//   List<String> productsDetail;
//   // List<Pedido> listPedido;

//   DeliveryDetail({
//     Key? key,
//     required this.client,
//     required this.productsDetail,
//     // required this.listPedido,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // salesReport.deliveryDetail(listPedido, client);
//     return Scaffold(
//         body: Container(
//             padding: EdgeInsets.all(10),
//             child: ListView(
//               scrollDirection: Axis.vertical,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Cliente: ${client.nome}',
//                       style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//                     ),
//                     Spacer(flex: 1),
//                     InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.close_outlined))
//                   ],
//                 ),
//                 Text('${productsDetail}\n', style: TextStyle(fontSize: 18, color: Colors.black)),
//                 Text('Total de Entregas: ${salesReport.itemCount}',
//                     style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
//                 Spacer(flex: 1),
//                 Text('*Cliente idº.:\n${client.id}', style: TextStyle(fontSize: 16, color: Colors.grey)),
//                 Text('......................................................................................',
//                     style: TextStyle(fontSize: 14, color: Colors.grey)),
//               ],
//             )));
//   }
// }

// //////////////////////////////////////////////////////////////////
// class DeliveryDetail2 extends StatelessWidget {
//   SalesReport salesReport = SalesReport();
//   final formatter = NumberFormat("#,###.00", "pt_BR");
//   Cliente client;
//   List<String> productsDetail;
//   DeliveryDetail2({
//     Key? key,
//     required this.client,
//     required this.productsDetail,
//   }) : super(key: key);
//   // List<String> orderDetail;
//   // String totalOrder;
//   // List<String> productList;
//   // String totalProduct;

//   @override
//   Widget build(BuildContext context) {
//     // salesReport.deliveryDetail();
//     return Scaffold(
//       body: Column(
//         children: [
//           Spacer(flex: 10),
//           Expanded(
//             flex: 50,
//             child: Container(
//                 padding: EdgeInsets.all(20),
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨',
//                         style: TextStyle(fontSize: 17, color: Colors.grey)),
//                     Row(
//                       children: [
//                         Text(
//                           'Cliente: ${client.nome}',
//                           style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//                         ),
//                         Spacer(flex: 1),
//                         InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.close_outlined))
//                       ],
//                     ),
//                     // '\n${element.nome} - qtde: ${order.quantidades[index]} - Valor: R\$ ${element.valor}\nTotal: ${element.valor * order.quantidades[index]}\n');
//                     Text('${productsDetail}\n', style: TextStyle(fontSize: 20, color: Colors.black)),
//                     Text('Total Pedido: R\$ ${formatter.format(salesReport.totalPorCliente)}',
//                         style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
//                     Spacer(flex: 1),
//                     Text('*Cliente idº.:\n${client.id}', style: TextStyle(fontSize: 16, color: Colors.grey)),
//                     // Text('*Atendente: ${pedido.atendente.nome}', style: TextStyle(fontSize: 17, color: Colors.grey)),
//                     Text('......................................................................................',
//                         style: TextStyle(fontSize: 14, color: Colors.grey)),
//                   ],
//                 )),
//           ),
//           Spacer(flex: 10),
//         ],
//       ),
//     );
//   }
// }
