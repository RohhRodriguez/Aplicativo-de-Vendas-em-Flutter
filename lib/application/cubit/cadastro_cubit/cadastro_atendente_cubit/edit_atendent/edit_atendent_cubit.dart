import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../domain/models/atendente.dart';
import '../../../../../domain/models/repository/atendentes_repository.dart';
part 'edit_atendent_state.dart';

class EditAtendentCubit extends Cubit<EditAtendentState> {
  final AtendenteRepository atendenteRepository;
  EditAtendentCubit(
    this.atendenteRepository,
  ) : super(EditAtendentInitial());

  waitingEditAtendent(String idAtendente) {
    Atendente atendente = atendenteRepository.byId(idAtendente);
    emit(WaitingEditAtendente(atendente: atendente));
  }

  setAtendent(Atendente atendente) async {
    await atendenteRepository.put(atendente);
  }
}
