import 'package:bloc/bloc.dart';
import '../../../../../domain/models/atendente.dart';
import '../../../../../domain/models/repository/atendentes_repository.dart';
part 'edit_atendent_state.dart';

class EditAtendentCubit extends Cubit<EditAtendentState> {
  final AtendenteRepository atendenteRepository;
  EditAtendentCubit(
    this.atendenteRepository,
  ) : super(EditAtendentInitial());

  waitingEditAtendent(Atendente atendente) {
    emit(WaitingEditAtendente3(atendente: atendente));
  }

  setAtendent(Atendente atendente) async {
    await atendenteRepository.put(atendente);
  }
}
