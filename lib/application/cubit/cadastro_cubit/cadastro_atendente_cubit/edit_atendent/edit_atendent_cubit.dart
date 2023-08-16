import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../domain/models/atendente.dart';
import '../atendent_list/atendente_list_cubit.dart';
part 'edit_atendent_state.dart';

class EditAtendentCubit extends Cubit<EditAtendentState> {
  EditAtendentCubit() : super(EditAtendentInitial());

  waitingEditAtendent(String idAtendente) {
    AtendenteListCubit atendenteListCubit = AtendenteListCubit();
    Atendente atendente = atendenteListCubit.atendenteRepository.byId(idAtendente);
    emit(WaitingEditAtendente3(atendente: atendente));
  }

  setAtendent(Atendente atendente) async {
    await Future.delayed(const Duration(seconds: 2));
    // await atendenteRepository.put(atendente);
    AtendenteListCubit atendenteListCubit = AtendenteListCubit();
    atendenteListCubit.setAtendent(atendente);
  }
}
