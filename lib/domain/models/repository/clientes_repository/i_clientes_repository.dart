import '../../cliente.dart';

abstract class IClienteRepository {
  List<Cliente> getAll();
  List<Cliente> sortList();
  Cliente byIndex(int i);
  Cliente byId(String idCliente);
  put(Cliente cliente);
  remove(Cliente cliente);
}
