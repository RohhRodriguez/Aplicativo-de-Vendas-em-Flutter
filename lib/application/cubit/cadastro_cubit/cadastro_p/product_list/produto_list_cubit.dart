import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projeto_desafio_flutter/application/cubit/cadastro_cubit/cadastro_p/product_list/produto_list_state.dart';
import '../../../../../../domain/models/produto.dart';
import '../../../../../../domain/models/repository/produtos_repository/produtos_repository.dart';

class ProdutoListCubit extends Cubit<ProductListState> {
  final ProdutoRepository produtoRepository;
  ProdutoListCubit(
    this.produtoRepository,
  ) : super(CadastroProductInitial()) {
    emit(LoadingListProduct());
  }

  generateListProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    List<Produto> productList = await produtoRepository.sortList();
    emit(SuccessListProduct(productList: productList));
  }

  addProduct(Produto produto) async {
    await produtoRepository.put(produto);
    generateListProducts();
  }

  delete(Produto produto) async {
    await Future.delayed(const Duration(seconds: 2));
    await produtoRepository.remove(produto);
    generateListProducts();
  }
}
