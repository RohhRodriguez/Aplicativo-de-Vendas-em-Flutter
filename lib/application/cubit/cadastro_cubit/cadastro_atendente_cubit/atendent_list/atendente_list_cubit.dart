// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import '../../../../../domain/models/atendente.dart';
// import '../../../../../domain/models/repository/atendentes_repository.dart';
// part 'atendente_list_state.dart';

// class AtendenteListCubit extends Cubit<AtendentListState> {
//   final AtendenteRepository atendenteRepository = AtendenteRepository();
//   AtendenteListCubit() : super(CadastroAtendenteInitial()) {
//     emit(LoadingListAtendente());
//   }

//   generateListAtendents() async {
//     await Future.delayed(const Duration(seconds: 3));
//     List<Atendente> atendentList = await atendenteRepository.sortList();
//     emit(SuccessListAtendente(atendentList: atendentList));
//   }

//   waitingEditAtendent(Atendente atendente) {
//     emit(WaitingEditAtendente(atendente: atendente));
//   }

//   addAtendent(Atendente atendente) async {
//     await atendenteRepository.add(atendente);
//     List<Atendente> atendentList = await atendenteRepository.sortList();
//     emit(SuccessListAtendente(atendentList: atendentList));
//   }

//   setAtendent(Atendente atendente) async {
//     await Future.delayed(const Duration(seconds: 2));
//     await atendenteRepository.put(atendente);
//   }

//   delete(Atendente atendente) async {
//     await Future.delayed(const Duration(seconds: 2));
//     await atendenteRepository.remove(atendente);
//     List<Atendente> atendentList2 = await atendenteRepository.sortList();
//     emit(SuccessListAtendente(atendentList: atendentList2));
//   }
// }
//////////////////////////////////////////////////////////
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../domain/models/atendente.dart';
import '../../../../../domain/models/repository/atendentes_repository.dart';
part 'atendente_list_state.dart';

class AtendenteListCubit extends Cubit<AtendentListState> {
  final AtendenteRepository atendenteRepository = AtendenteRepository();
  AtendenteListCubit() : super(CadastroAtendenteInitial()) {
    emit(LoadingListAtendente());
  }

  generateListAtendents() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Atendente> atendentList = await atendenteRepository.sortList();
    emit(SuccessListAtendente(atendentList: atendentList));
  }

  // waitingEditAtendent(Atendente atendente) {
  //   emit(WaitingEditAtendente(atendente: atendente));
  // }

  waitingEditAtendent(String idAtendente) {
    AtendenteListCubit atendenteListCubit = AtendenteListCubit();
    Atendente atendente = atendenteListCubit.atendenteRepository.byId(idAtendente);
    emit(WaitingEditAtendente(atendente: atendente));
  }

  addAtendent(Atendente atendente) async {
    await atendenteRepository.add(atendente);
    List<Atendente> atendentList = await atendenteRepository.sortList();
    emit(SuccessListAtendente(atendentList: atendentList));
  }

  setAtendent(Atendente atendente) async {
    emit(LoadingListAtendente());
    await Future.delayed(const Duration(seconds: 2));
    await atendenteRepository.put(atendente);
    List<Atendente> atendentList = await atendenteRepository.sortList();
    emit(SuccessListAtendente(atendentList: atendentList));
  }

  delete(Atendente atendente) async {
    await Future.delayed(const Duration(seconds: 2));
    await atendenteRepository.remove(atendente);
    List<Atendente> atendentList2 = await atendenteRepository.sortList();
    emit(SuccessListAtendente(atendentList: atendentList2));
  }
}
