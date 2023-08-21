import 'package:projeto_desafio_flutter/domain/models/cliente.dart';
import 'package:projeto_desafio_flutter/domain/models/repository/clientes_repository/i_clientes_repository.dart';
import '../../../../infrastructure/data.dart';

class ClienteRepository implements IClienteRepository {
  final Mock mock = Mock();

  @override
  Cliente byIndex(int i) {
    return sortList().elementAt(i);
  }

  @override
  Cliente byId(String idCliente) {
    Cliente cliente = getAll().firstWhere((element) => element.id == idCliente);
    return cliente;
  }

  @override
  List<Cliente> getAll() {
    return mock.clientes;
  }

  @override
  List<Cliente> sortList() {
    final List<Cliente> ordenado = getAll().toList();
    ordenado.sort((a, b) => a.nome.compareTo(b.nome));
    return ordenado;
  }

  @override
  put(Cliente cliente) {
    if (mock.clientes.contains(cliente)) {
      mock.clientes.remove(cliente);
      mock.clientes.add(cliente);
    } else {
      mock.clientes.add(cliente);
    }
  }

  @override
  remove(Cliente Cliente) {
    mock.clientes.remove(Cliente);
  }
}
