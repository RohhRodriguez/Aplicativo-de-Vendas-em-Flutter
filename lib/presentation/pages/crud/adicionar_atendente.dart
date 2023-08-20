// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
// import 'package:projeto_desafio_flutter/infrastructure/data.dart';
// import '../../../application/cubit/cadastro_cubit/cadastro_atendente_cubit/atendent_list/atendente_list_cubit.dart';

// //valueObject
// class AdicionarAtendente extends StatefulWidget {
//   const AdicionarAtendente({Key? key}) : super(key: key);
//   @override
//   State<AdicionarAtendente> createState() => _AdicionarAtendenteState();
// }

// class _AdicionarAtendenteState extends State<AdicionarAtendente> {
//   final AtendenteListCubit atendenteListCubit = AtendenteListCubit();
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   final Map<String, dynamic> _formData = {};

//   void _saveForm() {
//     final bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       _formKey.currentState!.save();
//       atendenteListCubit
//           .setAtendent(Atendente(comissao: _formData['comissao'], id: uuid.v4(), nome: _formData['nome']));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar:
//             AppBar(title: const Text('Adicionar Atendente '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
//         body: Padding(
//           padding: const EdgeInsets.all(30),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 TextFormField(
//                   validator: (value) {
//                     if (value != null && value.trim().length < 3) {
//                       return 'Insira mais de 3 caracteres';
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                       hintText: 'Insira o nome do Atendente',
//                       labelText: 'Nome do Atendente',
//                       border: OutlineInputBorder(),
//                       errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//                   onSaved: (value) {
//                     _formData['nome'] = value;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   validator: (value) {
//                     try {
//                       var valor = double.tryParse(value!)!;
//                       if (valor < 0 || valor > 100) {
//                         return 'Insira um valor entre 0 e 100!';
//                       } else {
//                         return null;
//                       }
//                     } catch (e) {
//                       return 'Insira um número válido!';
//                     }
//                   },
//                   decoration: const InputDecoration(
//                       hintText: 'Insira o percentual de comissão do Atendente',
//                       labelText: 'Comissão do Atendente',
//                       border: OutlineInputBorder(),
//                       errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//                   onSaved: (value) {
//                     var valor = double.parse(value!);
//                     _formData['comissao'] = valor;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton.icon(
//                     onPressed: _saveForm,
//                     icon: const Icon(Icons.save),
//                     label: const Text('Salvar'),
//                     style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green))),
//                 Expanded(
//                   child: BlocProvider(
//                     create: (context) => atendenteListCubit..generateListAtendents(),
//                     child: BlocBuilder<AtendenteListCubit, AtendentListState>(builder: (context, state) {
//                       if (state is SuccessListAtendente) {
//                         return ListView.builder(
//                             itemCount: state.atendentList.length,
//                             itemBuilder: (context, i) {
//                               return ListTile(
//                                 subtitle: Text(
//                                   '${state.atendentList[i].id}%',
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                                 title: Row(children: [
//                                   const Icon(Icons.person),
//                                   const Spacer(flex: 1),
//                                   Text(state.atendentList[i].nome),
//                                   const Spacer(flex: 1),
//                                   Text('${state.atendentList[i].comissao}%'),
//                                   const Spacer(flex: 1),
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute<void>(
//                                             builder: (BuildContext context) => AtendenteEdit(
//                                                 atendente: state.atendentList[i],
//                                                 atendenteListCubit: atendenteListCubit)),
//                                       );
//                                     },
//                                     child: Ink(
//                                         child: const Icon(
//                                       Icons.edit,
//                                       color: Colors.blue,
//                                     )),
//                                   ),
//                                   const Spacer(flex: 1),
//                                   InkWell(
//                                     onTap: () {
//                                       atendenteListCubit.delete(state.atendentList[i]);
//                                     },
//                                     child: Ink(
//                                         child: const Icon(
//                                       Icons.delete,
//                                       color: Color.fromARGB(255, 85, 85, 85),
//                                     )),
//                                   ),
//                                 ]),
//                               );
//                             });
//                       }
//                       return const Center(child: CircularProgressIndicator());
//                     }),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

// //////////////////////////////////////////////////////////////
// class AtendenteEdit extends StatelessWidget {
//   final Atendente atendente;
//   final AtendenteListCubit atendenteListCubit;
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   final Map<String, dynamic> _formData = {};
//   AtendenteEdit({
//     Key? key,
//     required this.atendente,
//     required this.atendenteListCubit,
//   }) : super(key: key);

//   void _saveForm(Atendente atendente) {
//     final bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       _formKey.currentState!.save();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Editar Atendente '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
//         body: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Form(
//             key: _formKey,
//             child: Column(children: [
//               TextFormField(
//                 readOnly: true,
//                 initialValue: atendente.id,
//                 decoration: const InputDecoration(
//                   labelText: 'Id do Atendente',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 initialValue: atendente.nome,
//                 validator: (value) {
//                   if (value != null && value.trim().length < 3) {
//                     return 'Insira mais de 3 caracteres';
//                   }
//                   return null;
//                 },
//                 decoration: const InputDecoration(
//                     hintText: 'Insira o nome do Atendente',
//                     labelText: 'Nome do Atendente',
//                     border: OutlineInputBorder(),
//                     errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//                 onSaved: (value) {
//                   _formData['nome'] = value;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 initialValue: '${atendente.comissao}',
//                 validator: (value) {
//                   try {
//                     var valor = double.tryParse(value!)!;
//                     if (value.trim().isEmpty && valor.isNaN && valor > 100) {
//                       return 'Numero de caracteres menor do que o permitido!';
//                     } else if (valor.isNaN || valor > 100) {
//                       return 'Insira um valor entre 0 e 100!';
//                     } else {
//                       return null;
//                     }
//                   } catch (e) {
//                     return 'Insira um número válido!';
//                   }
//                 },
//                 decoration: const InputDecoration(
//                     hintText: 'Insira o percentual de comissão do Atendente',
//                     labelText: 'Comissão do Atendente',
//                     border: OutlineInputBorder(),
//                     errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
//                 onSaved: (value) {
//                   var valor = double.tryParse(value!)! + 0.00;
//                   _formData['comissao'] = valor;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton.icon(
//                   onPressed: () {
//                     _saveForm(atendente);
//                     atendente.nome = _formData['nome'];
//                     atendente.comissao = _formData['comissao'];
//                     atendenteListCubit.setAtendent(atendente);
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.save),
//                   label: const Text('Salvar'),
//                   style: const ButtonStyle()),
//             ]),
//           ),
//         ));
//   }
// }

// /////////////////////////////////////////////////////////////////////////////
// class ListaAtendentes extends StatelessWidget {
//   List<Atendente> atendentList;
//   final AtendenteListCubit atendenteListCubit;
//   ListaAtendentes({
//     Key? key,
//     required this.atendentList,
//     required this.atendenteListCubit,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: atendentList.length,
//         itemBuilder: (context, i) {
//           return ListTile(
//             subtitle: Text(
//               '${atendentList[i].id}%',
//               style: const TextStyle(fontSize: 14),
//             ),
//             title: Row(children: [
//               const Icon(Icons.person),
//               const Spacer(flex: 1),
//               Text(atendentList[i].nome),
//               const Spacer(flex: 1),
//               Text('${atendentList[i].comissao}%'),
//               const Spacer(flex: 1),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute<void>(
//                         builder: (BuildContext context) =>
//                             AtendenteEdit(atendente: atendentList[i], atendenteListCubit: atendenteListCubit)),
//                   );
//                 },
//                 child: Ink(
//                     child: const Icon(
//                   Icons.edit,
//                   color: Colors.blue,
//                 )),
//               ),
//               const Spacer(flex: 1),
//               InkWell(
//                 onTap: () {
//                   atendenteListCubit.delete(atendentList[i]);
//                 },
//                 child: Ink(
//                     child: const Icon(
//                   Icons.delete,
//                   color: Color.fromARGB(255, 85, 85, 85),
//                 )),
//               ),
//             ]),
//           );
//         });
//   }
// }
