import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../domain/models/atendente.dart';
import '../../../../../domain/models/repository/atendentes_repository.dart';
import '../atendent_list/atendente_list_cubit.dart';
part 'edit_atendent_state.dart';

class EditAtendentCubit extends Cubit<EditAtendentState> {
  AtendenteListCubit atendenteListCubit = AtendenteListCubit();
  AtendenteRepository atendenteRepository = AtendenteRepository();
  EditAtendentCubit() : super(EditAtendentInitial());

  // waitingEditAtendent(String idAtendente) {
  //   Atendente atendente = atendenteListCubit.atendenteRepository.byId(idAtendente);
  //   emit(WaitingEditAtendente3(atendente: atendente));
  // }
  waitingEditAtendent(Atendente atendente) {
    // Atendente atendente = atendenteListCubit.atendenteRepository.(idAtendente);
    emit(WaitingEditAtendente3(atendente: atendente));
  }

  setAtendent(Atendente atendente) async {
    await Future.delayed(const Duration(seconds: 2));
    await atendenteRepository.put(atendente);
    // List<Atendente> atendentList2 = await atendenteRepository.sortList();
    // atendenteListCubit.emit(SuccessListAtendente(atendentList: atendentList2));
  }

  // setAtendent(Atendente atendente) async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   await atendenteListCubit.atendenteRepository.put(atendente);
  //   List<Atendente> atendentList = await atendenteListCubit.atendenteRepository.sortList();
  //   atendenteListCubit.emit(SuccessListAtendente(atendentList: atendentList));
  // }
}

  // setAtendent(Atendente atendente) async {
  //   emit(LoadingListAtendente());
  //   await Future.delayed(const Duration(seconds: 2));
  //   await atendenteRepository.put(atendente);
  //   List<Atendente> atendentList = await atendenteRepository.sortList();
  //   emit(SuccessListAtendente(atendentList: atendentList));
  // }