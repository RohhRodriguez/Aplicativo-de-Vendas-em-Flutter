import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../domain/models/atendente.dart';
import '../../../../../domain/models/repository/atendentes_repository.dart';
part 'cadastro_atendente_state.dart';

class CadastroAtendenteCubit extends Cubit<CadastroAtendenteState> {
  AtendenteRepository atendenteRepository = AtendenteRepository();
  CadastroAtendenteCubit() : super(CadastroAtendenteInitial());

  editAtendent(Atendente atendente) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(WaitingEditAtendente2(atendente: atendente));
  }

  setAtendent(Atendente atendente) async {
    await Future.delayed(const Duration(seconds: 2));
    await atendenteRepository.put(atendente);
    emit(CadastroAtendenteInitial());
    // List<Atendente> atendentList2 = await atendenteRepository.sortList();
    // emit(SuccessListAtendente(atendentList: atendentList2));
  }
}
