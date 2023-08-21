import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../domain/models/atendente.dart';
import '../../../../../domain/models/repository/atendentes_repository.dart';
part 'atendente_list_state.dart';

class AtendenteListCubit extends Cubit<AtendentListState> {
  final AtendenteRepository atendenteRepository;
  AtendenteListCubit(
    this.atendenteRepository,
  ) : super(CadastroAtendenteInitial()) {
    emit(LoadingListAtendente());
  }

  generateListAtendents() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Atendente> atendentList = await atendenteRepository.sortList();
    emit(SuccessListAtendente(atendentList: atendentList));
  }

  addAtendent(Atendente atendente) async {
    await atendenteRepository.put(atendente);
    generateListAtendents();
  }

  delete(Atendente atendente) async {
    await Future.delayed(const Duration(seconds: 2));
    await atendenteRepository.remove(atendente);
    generateListAtendents();
  }
}
