import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';
import 'package:projeto_desafio_flutter/presentation/pages/teste/lista_atendentes.dart';
import '../../../application/cubit/cadastro_cubit/cadastro_atendente_cubit/atendent_list/atendente_list_cubit.dart';

final AtendenteListCubit atendenteListCubit = AtendenteListCubit();

//valueObject
class AdicionarAtendente2 extends StatelessWidget {
  AdicionarAtendente2({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      atendenteListCubit
          .addAtendent(Atendente(comissao: _formData['comissao'], id: uuid.v4(), nome: _formData['nome']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('Adicionar Atendente '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value != null && value.trim().length < 3) {
                      return 'Insira mais de 3 caracteres';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: 'Insira o nome do Atendente',
                      labelText: 'Nome do Atendente',
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
                  onSaved: (value) {
                    _formData['nome'] = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    try {
                      var valor = double.tryParse(value!)!;
                      if (valor < 0 || valor > 100) {
                        return 'Insira um valor entre 0 e 100!';
                      } else {
                        return null;
                      }
                    } catch (e) {
                      return 'Insira um número válido!';
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: 'Insira o percentual de comissão do Atendente',
                      labelText: 'Comissão do Atendente',
                      border: OutlineInputBorder(),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
                  onSaved: (value) {
                    var valor = double.parse(value!);
                    _formData['comissao'] = valor;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                    onPressed: _saveForm,
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar'),
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue))),
                Expanded(
                    child: BlocProvider(
                  create: (context) => atendenteListCubit..generateListAtendents(),
                  child: BlocBuilder<AtendenteListCubit, AtendentListState>(
                    builder: (context, state) {
                      if (state is SuccessListAtendente) {
                        return AtendentsList2(atendentList: state.atendentList);
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
// import 'package:projeto_desafio_flutter/infrastructure/data.dart';
// import 'package:projeto_desafio_flutter/presentation/pages/teste/lista_atendentes.dart';
// import '../../../application/cubit/cadastro_cubit/cadastro_atendente_cubit/atendent_list/atendente_list_cubit.dart';

// final AtendenteListCubit atendenteListCubit = AtendenteListCubit();

// //valueObject
// class AdicionarAtendente2 extends StatelessWidget {
//   AdicionarAtendente2({Key? key}) : super(key: key);
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   final Map<String, dynamic> _formData = {};

//   void _saveForm() {
//     final bool isValid = _formKey.currentState!.validate();
//     if (isValid) {
//       _formKey.currentState!.save();
//       atendenteListCubit
//           .addAtendent(Atendente(comissao: _formData['comissao'], id: uuid.v4(), nome: _formData['nome']));
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
//                     style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue))),
//                 Expanded(
//                     child:
//                         //   BlocProvider(
//                         // create: (context) => atendenteListCubit..generateListAtendents(),
//                         // child: BlocBuilder<AtendenteListCubit, AtendentListState>(
//                         //   builder: (context, state) {
//                         //     if (state is SuccessListAtendente) {
//                         //       return
//                         AtendentsList2()
//                     //   }
//                     //   return const Center(child: CircularProgressIndicator());
//                     // },
//                     ),
//                 // ))
//               ],
//             ),
//           ),
//         ));
//   }
// }