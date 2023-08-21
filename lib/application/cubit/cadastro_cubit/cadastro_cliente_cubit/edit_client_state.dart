part of 'edit_client_cubit.dart';

@immutable
abstract class EditClientState {}

class EditClientInitial extends EditClientState {}

class WaitingEditClient extends EditClientState {
  final Cliente cliente;
  WaitingEditClient({
    required this.cliente,
  });
}
