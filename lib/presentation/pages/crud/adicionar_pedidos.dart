// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
// import 'package:projeto_desafio_flutter/domain/provider/produtos.dart';
// import 'package:provider/provider.dart';
// import 'package:projeto_desafio_flutter/infrastructure/data.dart';

// import '../../../domain/models/cliente.dart';
// import '../../../domain/models/pedido.dart';
// import '../../../domain/provider/pedidos.dart';

// final formatter = NumberFormat("#,##0.00", "pt_BR");

// class AdicionarPedido extends StatefulWidget {
//   const AdicionarPedido({Key? key}) : super(key: key);
//   @override
//   State<AdicionarPedido> createState() => _AdicionarPedidoState();
// }

// class _AdicionarPedidoState extends State<AdicionarPedido> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   final Map<String, dynamic> _formData = {};
//   int _counter = 0;

//   get quantidade => _counter;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   List<DropdownMenuItem<Cliente>> getDropDownItems() {
//     List<DropdownMenuItem<Cliente>> dropdownItems = [];
//     for (Cliente cliente in Mock().clientes) {
//       DropdownMenuItem<Cliente> newItem = DropdownMenuItem(
//         value: cliente,
//         child: Text(
//           cliente.nome,
//         ),
//       );
//       dropdownItems.add(newItem);
//     }
//     return dropdownItems;
//   }

//   List<DropdownMenuItem<Atendente>> getDropDownItemsAtendents() {
//     List<DropdownMenuItem<Atendente>> dropdownItemsAtendents = [];
//     for (Atendente atendente in Mock().atendentes) {
//       DropdownMenuItem<Atendente> newItem = DropdownMenuItem(
//         value: atendente,
//         child: Text(
//           '${atendente.nome} (comissão: ${atendente.comissao}%)',
//         ),
//       );
//       dropdownItemsAtendents.add(newItem);
//     }
//     return dropdownItemsAtendents;
//   }

//   void _saveForm() {
//     final bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       _formKey.currentState!.save();
//       Provider.of<Pedidos>(context, listen: false).put(Pedido(
//           id: uuid.v4(),
//           cliente: _formData['cliente'],
//           atendente: _formData['atendente'],
//           produtos: _formData['produto'],
//           quantidades: _formData['quantidade']));
//     }
//   }

//   void onChanged() {}

//   @override
//   Widget build(BuildContext context) {
//     final Pedidos pedidos = Provider.of(context);
//     final Produtos produtos = Provider.of(context);
//     return Scaffold(
//       appBar: AppBar(title: const Text('Adicionar Pedidos '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               DropdownButtonFormField(
//                 dropdownColor: Color.fromARGB(255, 192, 226, 255),
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Selecione o cliente',
//                 ),
//                 items: getDropDownItems(),
//                 onChanged: (value) => onChanged(),
//                 onSaved: (value) {
//                   _formData['cliente'] = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               DropdownButtonFormField(
//                 dropdownColor: Color.fromARGB(255, 192, 226, 255),
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Selecione o atendente',
//                 ),
//                 items: getDropDownItemsAtendents(),
//                 onChanged: (value) => onChanged(),
//                 onSaved: (value) {
//                   _formData['atendente'] = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Expanded(
//                 child: Consumer<Pedidos>(builder: (context, pedidos, child) {
//                   return ListView.builder(
//                       itemCount: produtos.count,
//                       itemBuilder: (context, i) {
//                         return ListTile(
//                           title: Row(children: [
//                             const Icon(Icons.pie_chart),
//                             Text(produtos.byIndex(i).nome),
//                             const Spacer(flex: 1),
//                             Text('R\$ ${formatter.format(produtos.byIndex(i).valor)}'),
//                             const Spacer(flex: 1),
//                             InkWell(
//                               // onTap: () => __incrementCounter(),
//                               child: Ink(
//                                 child: const Icon(
//                                   Icons.add_circle,
//                                   color: Color.fromARGB(255, 85, 85, 85),
//                                 ),
//                               ),
//                             ),
//                             const Spacer(flex: 1),
//                             Builder(builder: (context) {
//                               return Text('$quantidade');
//                             }),
//                             const Spacer(flex: 1),
//                             InkWell(
//                               onTap: () {
//                                 produtos.remove(produtos.byIndex(i));
//                               },
//                               child: Ink(
//                                 child: const Icon(
//                                   Icons.do_disturb_on_rounded,
//                                   color: Color.fromARGB(255, 85, 85, 85),
//                                 ),
//                               ),
//                             ),
//                             const Spacer(flex: 2),
//                             InkWell(
//                               onTap: () {
//                                 produtos.remove(produtos.byIndex(i));
//                               },
//                               child: Ink(
//                                 child: const Icon(
//                                   Icons.check_circle,
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ),
//                           ]),
//                         );
//                       });
//                 }),
//               ),
//               ElevatedButton.icon(
//                   onPressed: _saveForm,
//                   icon: const Icon(Icons.save),
//                   label: const Text('Salvar'),
//                   style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //////////////////////////////////////////////////////////////
// class PedidoEdit extends StatelessWidget {
//   final Pedido pedidoSelecionado;
//   final AdicionarPedido adicionarPedidos = AdicionarPedido();
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   final Map<String, dynamic> _formData = {};
//   PedidoEdit({
//     Key? key,
//     required this.pedidoSelecionado,
//   }) : super(key: key);

//   void _loadFormData(Pedido pedido) {
//     _formData['id'] = pedido.id;
//     _formData['cliente'] = pedido.cliente;
//     _formData['atendente'] = pedido.atendente;
//     _formData['produtos'] = pedido.produtos;
//     _formData['quantidades'] = pedido.quantidades;
//   }

//   void _saveForm() {
//     final bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       _formKey.currentState!.save();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Pedido pedido = pedidoSelecionado;
//     final Pedidos pedidos = Provider.of(context);
//     _loadFormData(pedido);
//     return Scaffold(
//       appBar: AppBar(title: const Text('Editar Pedido'), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Form(
//           key: _formKey,
//           child: Column(children: [
//             TextFormField(
//               readOnly: true,
//               initialValue: pedido.id,
//               decoration: const InputDecoration(
//                 labelText: 'Id do Pedido',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               initialValue: _formData['cliente'],
//               validator: (value) {
//                 if (value != null && value.trim().length < 3) {
//                   return 'Insira mais de 3 caracteres';
//                 }
//                 return null;
//               },
//               decoration: const InputDecoration(
//                   hintText: 'Insira o nome do Pedido',
//                   labelText: 'Nome do Pedido',
//                   border: OutlineInputBorder(),
//                   errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//               onSaved: (value) {
//                 _formData['cliente'] = value;
//               },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               initialValue: '${_formData['valor']}',
//               validator: (value) {
//                 if (value != null && value.trim().length < 3) {
//                   return 'Insira mais de 3 caracteres';
//                 }
//                 return null;
//               },
//               decoration: const InputDecoration(
//                   hintText: 'Insira o valor do Pedido',
//                   labelText: 'Valor do Pedido',
//                   border: OutlineInputBorder(),
//                   errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//               onSaved: (value) {
//                 // var valor = double.parse(value!);
//                 _formData['atendente'] = value;
//               },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton.icon(
//                 onPressed: () {
//                   _saveForm();
//                   pedido.cliente = _formData['cliente'];
//                   pedido.atendente = _formData['atendente'];
//                   pedidos.put(pedido);
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(Icons.save),
//                 label: const Text('Salvar'),
//                 style: const ButtonStyle()),
//           ]),
//         ),
//       ),
//     );
//   }
// }



//                  // return ListView.builder(
//                   //     itemCount: pedidos.count,
//                   //     itemBuilder: (context, i) {
//                   //       return ListTile(
//                   //           subtitle: Column(
//                   //             crossAxisAlignment: CrossAxisAlignment.start,
//                   //             children: [
//                   //               Text('Cliente: ${pedidos.byIndex(i).cliente.nome}', style: TextStyle(fontSize: 15)),
//                   //               Text('Atendente: ${pedidos.byIndex(i).atendente.nome}'),
//                   //               Text(
//                   //                 'Id: ${pedidos.byIndex(i).id}',
//                   //                 style: const TextStyle(fontSize: 14),
//                   //               ),
//                   //             ],
//                   //           ),
//                   //           title: Row(children: [
//                   //             const Icon(Icons.pie_chart),
//                   //             const SizedBox(
//                   //               width: 10,
//                   //             ),
//                   //             Text('Pedido ${i + 1}'),
//                   //             const Spacer(flex: 1),
//                   //             Text('R\$ ${formatter.format(pedidos.totalByIndex(i))}'),
//                   //             const Spacer(flex: 1),
//                   //             InkWell(
//                   //               onTap: () {
//                   //                 Navigator.push(
//                   //                   context,
//                   //                   MaterialPageRoute<void>(
//                   //                       builder: (BuildContext context) =>
//                   //                           PedidoEdit(pedidoSelecionado: pedidos.byIndex(i))),
//                   //                 );
//                   //               },
//                   //               child: Ink(
//                   //                   child: const Icon(
//                   //                 Icons.edit,
//                   //                 color: Colors.blue,
//                   //               )),
//                   //             ),
//                   //             const Spacer(flex: 1),
//                   //             InkWell(
//                   //               onTap: () {
//                   //                 pedidos.remove(pedidos.byIndex(i));
//                   //               },
//                   //               child: Ink(
//                   //                   child: const Icon(
//                   //                 Icons.delete,
//                   //                 color: Color.fromARGB(255, 85, 85, 85),
//                   //               )),
//                   //             ),
//                   //           ]));
//                   //     });
//                   // }),
//                   /////////////////////////////
//   // List<DropdownMenuItem<Produto>> getDropDownItemsProducts() {
//   //   List<DropdownMenuItem<Produto>> dropdownItemsProducts = [];
//   //   for (Produto produto in Mock().produtos) {
//   //     for (var estoque in Mock().estoques) {
//   //       if (estoque.produto.nome != produto.nome) {
//   //         continue;
//   //       }
//   //       DropdownMenuItem<Produto> newItem = DropdownMenuItem(
//   //         value: produto,
//   //         child: Text(
//   //           '${produto.nome} - valor: R\$ ${formatter.format(produto.valor)} (qtde: ${estoque.quantidade})',
//   //         ),
//   //       );
//   //       dropdownItemsProducts.add(newItem);
//   //     }
//   //   }
//   //   return dropdownItemsProducts;
//   // }
//   /////////////////////////////////////////////////
//   //             // DropdownButtonFormField(
//               //   dropdownColor: Color.fromARGB(255, 192, 226, 255),
//               //   decoration: const InputDecoration(
//               //     border: OutlineInputBorder(),
//               //     labelText: 'Selecione o produto',
//               //   ),
//               //   items: getDropDownItemsProducts(),
//               //   onChanged: (value) => onChanged(),
//               //   onSaved: (value) {
//               //     _formData['produto'] = value;
//               //   },
//               // ),
//               // const SizedBox(
//               //   height: 10,
//               // ),
//               ///////////////////
//                     // TextFormField(
//               //   validator: (value) {
//               //     try {
//               //       var valor = double.tryParse(value!)!;
//               //       if (valor < 0) {
//               //         return 'Campo não aceita valores negativos!';
//               //       } else {
//               //         return null;
//               //       }
//               //     } catch (e) {
//               //       return 'Insira um número válido!';
//               //     }
//               //   },
//               //   decoration: const InputDecoration(
//               //       hintText: 'Insira a quantidade desejada',
//               //       labelText: 'Quantidade',
//               //       border: OutlineInputBorder(),
//               //       errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//               //   onSaved: (value) {
//               //     var valor = double.parse(value!);
//               //     _formData['quantidade'] = valor;
//               //   },
//               // ),
//               // const SizedBox(
//               //   height: 10,
//               // ),