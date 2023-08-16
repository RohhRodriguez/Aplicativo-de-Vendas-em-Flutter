// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'package:projeto_desafio_flutter/presentation/pages/consolidated_values_page.dart';

// import '../../../application/services/report_service.dart';
// import '../../../domain/models/cliente.dart';
// import '../../../domain/models/pedido.dart';

// class OrderSale extends StatelessWidget {
//   SalesReport salesReport = SalesReport();
//   final formatter = NumberFormat("#,###.00", "pt_BR");
//   Pedido pedido;
//   // List<String> orderDetail;
//   String totalOrder;
//   // List<String> productList;
//   // String totalProduct;
//   OrderSale({
//     Key? key,
//     required this.pedido,
//     // required this.orderDetail,
//     required this.totalOrder,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     salesReport.orderDetail(pedido);
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
//                           'Cliente: ${pedido.cliente.nome}',
//                           style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//                         ),
//                         Spacer(flex: 1),
//                         InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.close_outlined))
//                       ],
//                     ),
//                     // '\n${element.nome} - qtde: ${order.quantidades[index]} - Valor: R\$ ${element.valor}\nTotal: ${element.valor * order.quantidades[index]}\n');
//                     Text('${salesReport.productsDetail}\n', style: TextStyle(fontSize: 20, color: Colors.black)),
//                     Text('Total Pedido: R\$ ${formatter.format(salesReport.totalOrder)}',
//                         style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
//                     Spacer(flex: 1),
//                     Text('*Pedido nº.:\n${pedido.id}', style: TextStyle(fontSize: 16, color: Colors.grey)),
//                     Text('*Atendente: ${pedido.atendente.nome}', style: TextStyle(fontSize: 17, color: Colors.grey)),
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
// // / / class OrderSale extends StatelessWidget {
// //   Pedido pedido;
// //   List productList;
// //   double totalProduct;
// //   OrderSale({
// //     Key? key,
// //     required this.pedido,
// //     required this.productList,
// //     required this.totalProduct,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           Spacer(flex: 10),
// //           Expanded(
// //             flex: 50,
// //             child: Container(
// //                 padding: EdgeInsets.all(20),
// //                 color: Colors.white,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text('¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨',
// //                         style: TextStyle(fontSize: 17, color: Colors.grey)),
// //                     Row(
// //                       children: [
// //                         Text(
// //                           'Cliente: ${pedido.cliente.nome}',
// //                           style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
// //                         ),
// //                         Spacer(flex: 1),
// //                         InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.close_outlined))
// //                       ],
// //                     ),
// //                     Row(
// //                       children: [
// //                         Text('${SalesReport().productsDetail}\n', style: TextStyle(fontSize: 20, color: Colors.black)),
// //                       ],
// //                     ),
// //                     // Text('${productList}\n', style: TextStyle(fontSize: 20, color: Colors.black)),
// //                     Text('Total Pedido: R\$ ${totalProduct}',
// //                         style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
// //                     Spacer(flex: 1),
// //                     Text('*Pedido nº.:\n${pedido.id}', style: TextStyle(fontSize: 16, color: Colors.grey)),
// //                     Text('*Atendente: ${pedido.atendente.nome}', style: TextStyle(fontSize: 17, color: Colors.grey)),
// //                     Text('......................................................................................',
// //                         style: TextStyle(fontSize: 14, color: Colors.grey)),
// //                   ],
// //                 )),
// //           ),
// //           Spacer(flex: 10),
// //         ],
// //       ),
// //     );
// //   }
// // }
