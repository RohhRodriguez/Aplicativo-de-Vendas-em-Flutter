part of 'edit_atendent_cubit.dart';

@immutable
abstract class EditAtendentState {}

class EditAtendentInitial extends EditAtendentState {}

class WaitingEditAtendente extends EditAtendentState {
  final Atendente atendente;
  WaitingEditAtendente({
    required this.atendente,
  });
}
