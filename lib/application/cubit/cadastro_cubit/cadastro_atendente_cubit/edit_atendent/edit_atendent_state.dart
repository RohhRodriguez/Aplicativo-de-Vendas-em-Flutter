// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_atendent_cubit.dart';

@immutable
abstract class EditAtendentState {}

class EditAtendentInitial extends EditAtendentState {}

class WaitingEditAtendente3 extends EditAtendentState {
  Atendente atendente;
  WaitingEditAtendente3({
    required this.atendente,
  });
}

class SuccessEditAtendente extends EditAtendentState {
  List<Atendente> atendentList2;
  SuccessEditAtendente({
    required this.atendentList2,
  });
}
