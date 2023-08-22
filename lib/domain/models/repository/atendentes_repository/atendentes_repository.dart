import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
import '../../../../infrastructure/data.dart';
import 'i_atendentes_repository.dart';

class AtendenteRepository implements IAtendenteRepository {
  final Mock mock = Mock();

  @override
  Atendente byId(String idAtendente) {
    Atendente atendente = getAll().firstWhere((element) => element.id == idAtendente);
    return atendente;
  }

  @override
  List<Atendente> getAll() {
    return mock.atendentes;
  }

  @override
  List<Atendente> sortList() {
    final List<Atendente> ordenado = getAll().toList();
    ordenado.sort((a, b) => a.nome.compareTo(b.nome));
    return ordenado;
  }

  @override
  put(Atendente atendente) {
    if (mock.atendentes.contains(atendente)) {
      mock.atendentes.remove(atendente);
      mock.atendentes.add(atendente);
    } else {
      mock.atendentes.add(atendente);
    }
  }

  @override
  remove(Atendente atendente) {
    mock.atendentes.remove(atendente);
  }
}
