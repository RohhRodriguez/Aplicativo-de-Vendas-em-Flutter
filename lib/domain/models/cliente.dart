import 'package:projeto_desafio_flutter/domain/models/pessoa.dart';

class Cliente extends Pessoa {
  String endereco;
  Cliente({
    required this.endereco,
    required super.id,
    required super.nome,
  });
}
