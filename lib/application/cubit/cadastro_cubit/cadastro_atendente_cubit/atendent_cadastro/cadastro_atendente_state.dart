// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cadastro_atendente_cubit.dart';

@immutable
abstract class CadastroAtendenteState {}

class CadastroAtendenteInitial extends CadastroAtendenteState {}

class WaitingEditAtendente2 extends CadastroAtendenteState {
  final Atendente atendente;
  WaitingEditAtendente2({
    required this.atendente,
  });
}

class SuccessEditAtendente extends CadastroAtendenteState {
  final List<Atendente> atendentList;
  SuccessEditAtendente({
    required this.atendentList,
  });
}

////////////////////////////////////////////////////////////////

class SuccessCadastroAtendente extends CadastroAtendenteState {}

class EditAtendente extends CadastroAtendenteState {}

class ErrorCadastroAtendente extends CadastroAtendenteState {}
