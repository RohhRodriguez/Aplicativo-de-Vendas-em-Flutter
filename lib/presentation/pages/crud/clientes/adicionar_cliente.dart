import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_desafio_flutter/domain/models/cliente.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';
import '../../../../application/cubit/cadastro_cubit/cadastro_cliente_cubit/client_list_cubit.dart';
import '../../../../domain/models/repository/clientes_repository/clientes_repository.dart';
import 'lista_clientes.dart';

//valueObject
class AdicionarCliente extends StatelessWidget {
  final ClientListCubit clientListCubit = ClientListCubit(GetIt.instance<ClienteRepository>());
  AdicionarCliente({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      clientListCubit.addClients(Cliente(id: uuid.v4(), nome: _formData['nome'], endereco: _formData['endereco']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Adicionar Cliente '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
        body: Padding(
          padding: const EdgeInsets.all(25),
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
                    onPressed: _saveForm,
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar'),
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue))),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: BlocProvider<ClientListCubit>(
                      create: (context) => clientListCubit..generateListClientes(), child: const ClientsList()),
                ),
              ],
            ),
          ),
        ));
  }
}
