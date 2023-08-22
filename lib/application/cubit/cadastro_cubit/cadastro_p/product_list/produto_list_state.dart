import 'package:projeto_desafio_flutter/domain/models/produto.dart';

abstract class ProductListState {}

class CadastroProductInitial extends ProductListState {}

class LoadingListProduct extends ProductListState {}

class SuccessListProduct extends ProductListState {
  final List<Produto> productList;
  SuccessListProduct({required this.productList});
}

class ErrorAtendentList extends ProductListState {}
