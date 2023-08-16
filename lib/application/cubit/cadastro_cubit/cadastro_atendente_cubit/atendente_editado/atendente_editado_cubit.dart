import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/models/atendente.dart';
import '../../../../../domain/models/repository/atendentes_repository.dart';

part 'atendente_editado_state.dart';

class AtendenteEditadoCubit extends Cubit<AtendenteEditadoState> {
  AtendenteRepository atendenteRepository = AtendenteRepository();
  AtendenteEditadoCubit() : super(AtendenteEditadoInitial());

  setAtendent(Atendente atendente) async {
    emit(LoadingListAtendente3());
    await Future.delayed(const Duration(seconds: 2));
    await atendenteRepository.put(atendente);
    List<Atendente> atendentList2 = await atendenteRepository.sortList();
    // emit(SuccessListAtendente(atendentList: atendentList2));
    emit(SuccessListAtendenteAtualizada3(atendentList: atendentList2));
  }
}
