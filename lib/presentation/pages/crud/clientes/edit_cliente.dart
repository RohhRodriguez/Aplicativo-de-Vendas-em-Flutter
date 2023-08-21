import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../application/cubit/cadastro_cubit/cadastro_cliente_cubit/edit_client_cubit.dart';
import '../../../../domain/models/cliente.dart';
import '../../../../domain/models/repository/clientes_repository/clientes_repository.dart';

class ClienteEdit extends StatelessWidget {
  final EditClientCubit editClientCubit = EditClientCubit(GetIt.instance<ClienteRepository>());
  final String idCliente;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};
  ClienteEdit({
    Key? key,
    required this.idCliente,
  }) : super(key: key);

  void _saveForm(Cliente cliente) {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      cliente.nome = _formData['nome'];
      cliente.endereco = _formData['endereco'];
      editClientCubit.setCliente(cliente);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditClientCubit>(
      create: (context) => editClientCubit..waitingEditCliente(idCliente),
      child: BlocBuilder<EditClientCubit, EditClientState>(
        builder: (context, state) {
          if (state is WaitingEditClient) {
            return Scaffold(
                appBar:
                    AppBar(title: const Text('Editar Cliente'), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
                body: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        readOnly: true,
                        initialValue: state.cliente.id,
                        decoration: const InputDecoration(
                          labelText: 'Id do Cliente',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: state.cliente.nome,
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Insira mais de 3 caracteres';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Insira o nome do Cliente',
                            labelText: 'Nome do Cliente',
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
                        initialValue: state.cliente.endereco,
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Insira mais de 3 caracteres';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Insira o endereço do Cliente',
                            labelText: 'Endereço do Cliente',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
                        onSaved: (value) {
                          _formData['endereco'] = value;
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
                            _saveForm(state.cliente);
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
