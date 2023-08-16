import 'package:projeto_desafio_flutter/domain/models/pessoa.dart';

class Atendente extends Pessoa {
  double comissao;
  Atendente({
    required this.comissao,
    required super.id,
    required super.nome,
  });
}
