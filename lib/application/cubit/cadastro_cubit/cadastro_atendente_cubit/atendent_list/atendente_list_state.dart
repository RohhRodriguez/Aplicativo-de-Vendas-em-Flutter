// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'atendente_list_cubit.dart';

@immutable
abstract class AtendentListState {}

class CadastroAtendenteInitial extends AtendentListState {}

class LoadingListAtendente extends AtendentListState {}

class SuccessListAtendente extends AtendentListState {
  final List<Atendente> atendentList;
  SuccessListAtendente({
    required this.atendentList,
  });
}

class WaitingEditAtendente extends AtendentListState {
  Atendente atendente;
  WaitingEditAtendente({
    required this.atendente,
  });
}

class SuccessListAtendenteAtualizada extends AtendentListState {
  final List<Atendente> atendentList;
  SuccessListAtendenteAtualizada({
    required this.atendentList,
  });
}

class ErrorAtendentList extends AtendentListState {}
