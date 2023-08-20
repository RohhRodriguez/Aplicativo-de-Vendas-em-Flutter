import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_desafio_flutter/presentation/pages/teste/edit_atendente.dart';

import '../../../application/cubit/cadastro_cubit/cadastro_atendente_cubit/atendent_list/atendente_list_cubit.dart';

// lifecycle
class AtendentsList extends StatefulWidget {
  const AtendentsList({
    Key? key,
  }) : super(key: key);

  @override
  State<AtendentsList> createState() => _AtendentsListState();
}

class _AtendentsListState extends State<AtendentsList> {
  @override
  void initState() {
    super.initState();
    context.read<AtendenteListCubit>().generateListAtendents();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AtendenteListCubit, AtendentListState>(
      builder: (context, state) {
        if (state is SuccessListAtendente) {
          return ListView.builder(
              itemCount: state.atendentList.length,
              itemBuilder: (context, i) {
                return ListTile(
                  subtitle: Text(
                    state.atendentList[i].id,
                    style: const TextStyle(fontSize: 14),
                  ),
                  title: Row(children: [
                    const Icon(Icons.person),
                    const Spacer(flex: 1),
                    Text(state.atendentList[i].nome),
                    const Spacer(flex: 1),
                    Text('${state.atendentList[i].comissao}%'),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => AtendenteEdit(atendente: state.atendentList[i])),
                        );
                        setState(() {});
                      },
                      child: Ink(
                          child: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      )),
                    ),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () {
                        context.read<AtendenteListCubit>().delete(state.atendentList[i]);
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
