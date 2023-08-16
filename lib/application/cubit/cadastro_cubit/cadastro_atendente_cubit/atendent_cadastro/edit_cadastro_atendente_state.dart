// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_cadastro_atendente_cubit.dart';

@immutable
abstract class EditCadastroAtendenteState {}

class EditCadastroAtendenteInitial extends EditCadastroAtendenteState {}

class WaitingEditAtendente extends EditCadastroAtendenteState {
  final Atendente atendente;
  WaitingEditAtendente({
    required this.atendente,
  });
}

class SuccessEditAtendente extends EditCadastroAtendenteState {}

class LoadingListAtendenteAtualizada extends EditCadastroAtendenteState {}

// class SuccessListAtendenteAtualizada extends EditCadastroAtendenteState {
//   final List<Atendente> atendentList;
//   SuccessListAtendenteAtualizada({
//     required this.atendentList,
//   });
// }
