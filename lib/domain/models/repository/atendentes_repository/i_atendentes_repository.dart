import 'package:projeto_desafio_flutter/domain/models/atendente.dart';

abstract class IAtendenteRepository {
  List<Atendente> getAll();
  List<Atendente> sortList();
  Atendente byId(String idAtendente);
  put(Atendente atendente);
  remove(Atendente atendente);
}
