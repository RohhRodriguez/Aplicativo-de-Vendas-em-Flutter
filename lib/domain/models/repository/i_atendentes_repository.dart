import 'package:projeto_desafio_flutter/domain/models/atendente.dart';

abstract class IAtendenteRepository {
  List<Atendente> getAll();
  List<Atendente> sortList();
  int getCount();
  Atendente byIndex(int i);
  Atendente byId(String idAtendente);
  put(Atendente atendente);
  add(Atendente atendente);
  remove(Atendente atendente);
}
