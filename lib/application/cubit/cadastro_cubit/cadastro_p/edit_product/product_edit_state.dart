import 'package:projeto_desafio_flutter/domain/models/produto.dart';

abstract class EditProductState {}

class EditProductInitial extends EditProductState {}

class WaitingEditProduct extends EditProductState {
  final Produto produto;
  WaitingEditProduct({
    required this.produto,
  });
}
