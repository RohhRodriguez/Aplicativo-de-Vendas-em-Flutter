// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import '../../../domain/models/pedido.dart';

// class ComissionDetail extends StatelessWidget {
//   Pedido pedido;
//   List<String> productList;
//   String totalProduct;
//   ComissionDetail({
//     Key? key,
//     required this.pedido,
//     required this.productList,
//     required this.totalProduct,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             padding: EdgeInsets.all(10),
//             child: ListView(
//               scrollDirection: Axis.vertical,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       'Atendente: ${pedido.atendente.nome}',
//                       style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//                     ),
//                     Spacer(flex: 1),
//                     InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.close_outlined))
//                   ],
//                 ),
//                 Text('${productList}\n', style: TextStyle(fontSize: 18, color: Colors.black)),
//                 Text('Total Comissões: R\$ ${totalProduct}',
//                     style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
//                 Spacer(flex: 1),
//                 Text('*Atendente id.:\n${pedido.atendente.id}', style: TextStyle(fontSize: 16, color: Colors.grey)),
//                 Text('......................................................................................',
//                     style: TextStyle(fontSize: 14, color: Colors.grey)),
//               ],
//             ))

//         // Expanded(
//         //   child: Container(
//         //     padding: EdgeInsets.all(10),
//         //     child: Column(
//         //       crossAxisAlignment: CrossAxisAlignment.start,
//         //       children: [
//         //         Row(
//         //           children: [
//         //             Text(
//         //               'Atendente: ${pedido.atendente.nome}',
//         //               style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
//         //             ),
//         //             Spacer(flex: 1),
//         //             InkWell(onTap: () => Navigator.pop(context), child: Icon(Icons.close_outlined))
//         //           ],
//         //         ),
//         //         Text('${productList}\n', style: TextStyle(fontSize: 20, color: Colors.black)),
//         //         Text('Total Pedido: R\$ ${totalProduct}',
//         //             style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
//         //         Spacer(flex: 1),
//         //         Text('*Pedido nº.:\n${pedido.id}', style: TextStyle(fontSize: 16, color: Colors.grey)),
//         //         Text('*Atendente: ${pedido.atendente.nome}', style: TextStyle(fontSize: 17, color: Colors.grey)),
//         //         Text('......................................................................................',
//         //             style: TextStyle(fontSize: 14, color: Colors.grey)),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//         );
//   }
// }