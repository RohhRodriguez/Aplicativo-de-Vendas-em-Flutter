// import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
// import '../../../infrastructure/data.dart';
// import 'i_atendentes_repository.dart';

// class AtendenteRepository implements IAtendenteRepository {
//   // final List<Atendente> atendentes = [...Mock().atendentes];
//   static List<Atendente> atendentes = Mock().atendentes;

//   @override
//   Atendente byIndex(int i) {
//     return sortList().elementAt(i);
//   }

//   @override
//   Atendente byId(String idAtendente) {
//     Atendente atendente = atendentes.firstWhere((element) => element.id == idAtendente);
//     return atendente;
//   }

//   @override
//   List<Atendente> getAll() {
//     return atendentes;
//   }

//   @override
//   List<Atendente> sortList() {
//     final List<Atendente> ordenado = atendentes.toList();
//     ordenado.sort((a, b) => a.nome.compareTo(b.nome));
//     return ordenado;
//   }

//   @override
//   int getCount() {
//     return atendentes.length;
//   }

//   @override
//   add(Atendente atendente) {
//     atendentes.add(atendente);
//   }

//   @override
//   put(Atendente atendente) {
//     final String idAtendente = atendente.id;
//     final Atendente teste = atendentes.firstWhere((element) => element.id == idAtendente);
//     if (atendentes.contains(teste)) {
//       atendentes.remove(atendente);
//       atendentes.add(atendente);
//     } else {
//       atendentes.add(atendente);
//     }
//   }

//   @override
//   remove(Atendente atendente) {
//     atendentes.remove(atendente);
//   }
// }
//////////////////////////////////////////////////////////////////////////
import 'package:projeto_desafio_flutter/domain/models/atendente.dart';
import '../../../infrastructure/data.dart';
import 'i_atendentes_repository.dart';

class AtendenteRepository implements IAtendenteRepository {
  final List<Atendente> atendentes = [...Mock().atendentes];

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
    return atendentes;
  }

  @override
  List<Atendente> sortList() {
    final List<Atendente> ordenado = getAll().toList();
    ordenado.sort((a, b) => a.nome.compareTo(b.nome));
    return ordenado;
  }

  @override
  int getCount() {
    return atendentes.length;
  }

  @override
  add(Atendente atendente) {
    atendentes.add(atendente);
  }

  @override
  put(Atendente atendente) {
    // final String idAtendente = atendente.id;
    // final Atendente teste = atendentes.firstWhere((element) => element.id == idAtendente);
    final a = getAll();
    if (a.contains(atendente)) {
      a.remove(atendente);
      a.add(atendente);
    } else {
      a.add(atendente);
    }
  }

  @override
  remove(Atendente atendente) {
    atendentes.remove(atendente);
  }
}
