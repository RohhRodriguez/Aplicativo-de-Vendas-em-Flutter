// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'atendente_editado_cubit.dart';

@immutable
abstract class AtendenteEditadoState {}

class AtendenteEditadoInitial extends AtendenteEditadoState {}

class LoadingListAtendente3 extends AtendenteEditadoState {}

class SuccessListAtendenteAtualizada3 extends AtendenteEditadoState {
  List<Atendente> atendentList;
  SuccessListAtendenteAtualizada3({
    required this.atendentList,
  });
}
