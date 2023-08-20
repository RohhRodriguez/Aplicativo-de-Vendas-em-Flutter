import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
import '../../../infrastructure/data.dart';
import 'i_atendentes_repository.dart';

class AtendenteRepository implements IAtendenteRepository {
  final Mock mock = Mock();

  @override
  Atendente byIndex(int i) {
    return sortList().elementAt(i);
  }

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
  int getCount() {
    return mock.atendentes.length;
  }

  @override
  add(Atendente atendente) {
    mock.atendentes.add(atendente);
  }

  @override
  put(Atendente atendente) {
    final String idAtendente = atendente.id;
    final Atendente teste = mock.atendentes.firstWhere((element) => element.id == idAtendente);
    if (mock.atendentes.contains(teste)) {
      mock.atendentes.remove(teste);
      mock.atendentes.add(atendente);
    } else {
      mock.atendentes.add(atendente);
    }
    mock.atendentes.forEach((element) {
      print('${element.nome} - ${element.id}');
    });
  }

  @override
  remove(Atendente atendente) {
    mock.atendentes.remove(atendente);
  }
}
