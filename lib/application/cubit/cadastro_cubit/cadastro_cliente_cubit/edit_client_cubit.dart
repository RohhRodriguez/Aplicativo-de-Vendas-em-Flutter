import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_desafio_flutter/domain/models/cliente.dart';
import '../../../../domain/models/repository/clientes_repository/clientes_repository.dart';

part 'edit_client_state.dart';

class EditClientCubit extends Cubit<EditClientState> {
  final ClienteRepository clienteRepository;
  EditClientCubit(
    this.clienteRepository,
  ) : super(EditClientInitial());

  waitingEditCliente(String idCliente) {
    Cliente cliente = clienteRepository.byId(idCliente);
    emit(WaitingEditClient(cliente: cliente));
  }

  setCliente(Cliente cliente) async {
    await clienteRepository.put(cliente);
  }
}
