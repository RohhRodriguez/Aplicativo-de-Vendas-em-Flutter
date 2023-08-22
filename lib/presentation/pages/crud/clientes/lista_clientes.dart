import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_desafio_flutter/presentation/pages/crud/clientes/edit_cliente.dart';
import '../../../../application/cubit/cadastro_cubit/cadastro_cliente_cubit/client_list/client_list_cubit.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientListCubit, ClientListState>(
      builder: (context, state) {
        if (state is SuccessListCliente) {
          return ListView.builder(
              itemCount: state.clientList.length,
              itemBuilder: (context, i) {
                return ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Endereço: ${state.clientList[i].endereco}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        'Id: ${state.clientList[i].id}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  title: Row(children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 5),
                    Text(
                      state.clientList[i].nome,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => ClienteEdit(idCliente: state.clientList[i].id)),
                        ).then((value) => context.read<ClientListCubit>().generateListClientes());
                      },
                      child: Ink(
                          child: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      )),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        context.read<ClientListCubit>().delete(state.clientList[i]);
                      },
                      child: Ink(
                          child: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 85, 85, 85),
                      )),
                    ),
                  ]),
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
