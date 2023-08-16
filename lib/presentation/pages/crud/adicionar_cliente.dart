// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:projeto_desafio_flutter/domain/provider/clientes.dart';
// import 'package:projeto_desafio_flutter/infrastructure/data.dart';

// import '../../../domain/models/cliente.dart';

// final formatter = NumberFormat("#,##0.00", "pt_BR");

// class AdicionarCliente extends StatefulWidget {
//   const AdicionarCliente({Key? key}) : super(key: key);
//   @override
//   State<AdicionarCliente> createState() => _AdicionarClienteState();
// }

// class _AdicionarClienteState extends State<AdicionarCliente> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   final Map<String, String> _formData = {};

//   void _saveForm() {
//     final bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       _formKey.currentState!.save();
//       Provider.of<Clientes>(context, listen: false)
//           .put(Cliente(id: uuid.v4(), nome: _formData['nome']!, endereco: _formData['endereco']!));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Clientes clientes = Provider.of(context);
//     return Scaffold(
//       appBar: AppBar(title: const Text('Adicionar clientes '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 validator: (value) {
//                   if (value != null && value.trim().length < 3) {
//                     return 'Insira mais de 3 caracteres';
//                   }
//                   return null;
//                 },
//                 decoration: const InputDecoration(
//                     hintText: 'Insira o nome do Cliente',
//                     labelText: 'Nome do Cliente',
//                     border: OutlineInputBorder(),
//                     errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//                 onSaved: (value) {
//                   _formData['nome'] = value!;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 validator: (value) {
//                   if (value != null && value.trim().length < 3) {
//                     return 'Insira mais de 3 caracteres';
//                   }
//                   return null;
//                 },
//                 decoration: const InputDecoration(
//                     hintText: 'Insira o Endereço do Cliente',
//                     labelText: 'Endereço do Cliente',
//                     border: OutlineInputBorder(),
//                     errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//                 onSaved: (value) {
//                   _formData['endereco'] = value!;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton.icon(
//                   onPressed: _saveForm,
//                   icon: const Icon(Icons.save),
//                   label: const Text('Salvar'),
//                   style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green))),
//               Expanded(
//                 child: Consumer<Clientes>(builder: (context, clientes, child) {
//                   return ListView.builder(
//                       itemCount: clientes.count,
//                       itemBuilder: (context, i) {
//                         return ListTile(
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(clientes.byIndex(i).endereco),
//                                 Text(
//                                   '${clientes.byIndex(i).id}\n',
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                             title: Row(children: [
//                               const Icon(Icons.person),
//                               const SizedBox(width: 10),
//                               Text(clientes.byIndex(i).nome),
//                               const Spacer(flex: 1),
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute<void>(
//                                         builder: (BuildContext context) =>
//                                             ClienteEdit(clienteselecionado: clientes.byIndex(i))),
//                                   );
//                                 },
//                                 child: Ink(
//                                     child: const Icon(
//                                   Icons.edit,
//                                   color: Colors.blue,
//                                 )),
//                               ),
//                               const SizedBox(width: 10),
//                               InkWell(
//                                 onTap: () {
//                                   clientes.remove(clientes.byIndex(i));
//                                 },
//                                 child: Ink(
//                                     child: const Icon(
//                                   Icons.delete,
//                                   color: Color.fromARGB(255, 85, 85, 85),
//                                 )),
//                               ),
//                             ]));
//                       });
//                 }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// //////////////////////////////////////////////////////////////
// class ClienteEdit extends StatelessWidget {
//   final Cliente clienteselecionado;
//   final AdicionarCliente adicionarclientes = AdicionarCliente();
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   final Map<String, dynamic> _formData = {};
//   ClienteEdit({
//     Key? key,
//     required this.clienteselecionado,
//   }) : super(key: key);

//   void _loadFormData(Cliente cliente) {
//     _formData['id'] = cliente.id;
//     _formData['nome'] = cliente.nome;
//     _formData['endereco'] = cliente.endereco;
//   }

//   void _saveForm() {
//     final bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       _formKey.currentState!.save();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Cliente cliente = clienteselecionado;
//     final Clientes clientes = Provider.of(context);
//     _loadFormData(cliente);
//     return Scaffold(
//       appBar: AppBar(title: const Text('Editar Cliente'), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Form(
//           key: _formKey,
//           child: Column(children: [
//             TextFormField(
//               readOnly: true,
//               initialValue: cliente.id,
//               decoration: const InputDecoration(
//                 labelText: 'Id do Cliente',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               initialValue: _formData['nome'],
//               validator: (value) {
//                 if (value != null && value.trim().length < 3) {
//                   return 'Insira mais de 3 caracteres';
//                 }
//                 return null;
//               },
//               decoration: const InputDecoration(
//                   hintText: 'Insira o nome do Cliente',
//                   labelText: 'Nome do Cliente',
//                   border: OutlineInputBorder(),
//                   errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//               onSaved: (value) {
//                 _formData['nome'] = value;
//               },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               initialValue: '${_formData['endereco']}',
//               validator: (value) {
//                 if (value != null && value.trim().length < 3) {
//                   return 'Insira mais de 3 caracteres';
//                 }
//                 return null;
//               },
//               decoration: const InputDecoration(
//                   hintText: 'Insira o endereço do Cliente',
//                   labelText: 'Endereço do Cliente',
//                   border: OutlineInputBorder(),
//                   errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//               onSaved: (value) {
//                 _formData['endereco'] = value;
//               },
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             ElevatedButton.icon(
//                 onPressed: () {
//                   _saveForm();
//                   cliente.nome = _formData['nome'];
//                   cliente.endereco = _formData['endereco'];
//                   clientes.put(cliente);
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
