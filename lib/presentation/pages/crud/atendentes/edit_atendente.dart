import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_desafio_flutter/application/cubit/cadastro_cubit/cadastro_atendente_cubit/edit_atendent/edit_atendent_cubit.dart';
import '../../../../domain/models/atendente.dart';
import '../../../../domain/models/repository/atendentes_repository/atendentes_repository.dart';

class AtendenteEdit extends StatelessWidget {
  final EditAtendentCubit editAtendentCubit = EditAtendentCubit(GetIt.instance<AtendenteRepository>());
  final String idAtendente;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};
  AtendenteEdit({
    Key? key,
    required this.idAtendente,
  }) : super(key: key);

  void _saveForm(Atendente atendente) {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      atendente.nome = _formData['nome'];
      atendente.comissao = _formData['comissao'];
      editAtendentCubit.setAtendent(atendente);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditAtendentCubit>(
      create: (context) => editAtendentCubit..waitingEditAtendent(idAtendente),
      child: BlocBuilder<EditAtendentCubit, EditAtendentState>(
        builder: (context, state) {
          if (state is WaitingEditAtendente) {
            return Scaffold(
                appBar: AppBar(
                    title: const Text('Editar Atendente '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
                body: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        readOnly: true,
                        initialValue: state.atendente.id,
                        decoration: const InputDecoration(
                          labelText: 'Id do Atendente',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: state.atendente.nome,
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
                        initialValue: '${state.atendente.comissao}',
                        validator: (value) {
                          try {
                            var valor = double.tryParse(value!)!;
                            if (value.trim().isEmpty && valor.isNaN && valor > 100) {
                              return 'Numero de caracteres menor do que o permitido!';
                            } else if (valor.isNaN || valor > 100) {
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
                          var valor = double.tryParse(value!)! + 0.00;
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
                          onPressed: () {
                            _saveForm(state.atendente);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.save),
                          label: const Text('Salvar'),
                          style: const ButtonStyle()),
                    ]),
                  ),
                ));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// lifecycle