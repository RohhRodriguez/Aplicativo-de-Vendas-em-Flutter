import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
import '../../../../../domain/models/repository/atendentes_repository.dart';
import '../atendent_list/atendente_list_cubit.dart';
import 'cadastro_atendente_cubit.dart';
part 'edit_cadastro_atendente_state.dart';

class EditCadastroAtendenteCubit extends Cubit<EditCadastroAtendenteState> {
  AtendenteRepository atendenteRepository = AtendenteRepository();
  AtendenteListCubit atendenteListCubit = AtendenteListCubit();
  EditCadastroAtendenteCubit() : super(EditCadastroAtendenteInitial());

  editAtendent(Atendente atendente) async {
    // await Future.delayed(const Duration(seconds: 2));
    // emit(WaitingEditAtendente(atendente: atendente));
  }

  saveAlteracaoAtendent(Atendente atendente) async {
    await Future.delayed(const Duration(seconds: 2));
    await atendenteRepository.put(atendente);
    // print(atendente.nome);
  }

  setAtendent(Atendente atendente) async {
    emit(LoadingListAtendenteAtualizada());
    await Future.delayed(const Duration(seconds: 2));
    await atendenteRepository.put(atendente);
    List<Atendente> atendentList2 = await atendenteRepository.sortList();
    atendenteListCubit.emit(SuccessListAtendente(atendentList: atendentList2));
    // emit(SuccessListAtendenteAtualizada(atendentList: atendentList2));
  }

  // editAtendent(String idAtendente) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Atendente atendente = await atendenteRepository.byId(idAtendente);
  //   emit(WaitingEditAtendente(atendent: atendente));
  // }
}
