part of 'client_list_cubit.dart';

@immutable
abstract class ClientListState {}

class CadastroClienteInitial extends ClientListState {}

class LoadingListCliente extends ClientListState {}

class SuccessListCliente extends ClientListState {
  final List<Cliente> clientList;
  SuccessListCliente({
    required this.clientList,
  });
}

class ErrorClientList extends ClientListState {}
