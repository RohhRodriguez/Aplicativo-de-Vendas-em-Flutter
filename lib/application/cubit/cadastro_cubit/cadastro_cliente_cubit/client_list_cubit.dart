import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../domain/models/cliente.dart';
import '../../../../domain/models/repository/clientes_repository/clientes_repository.dart';

part 'client_list_state.dart';

class ClientListCubit extends Cubit<ClientListState> {
  final ClienteRepository clienteRepository;
  ClientListCubit(
    this.clienteRepository,
  ) : super(CadastroClienteInitial()) {
    emit(LoadingListCliente());
  }

  generateListClientes() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Cliente> clientList = await clienteRepository.sortList();
    emit(SuccessListCliente(clientList: clientList));
  }

  addClients(Cliente cliente) async {
    await clienteRepository.put(cliente);
    generateListClientes();
  }

  delete(Cliente cliente) async {
    await Future.delayed(const Duration(seconds: 2));
    await clienteRepository.remove(cliente);
    generateListClientes();
  }
}
