import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:projeto_desafio_flutter/application/cubit/cadastro_cubit/cadastro_p/edit_product/product_edit_state.dart';
import '../../../../../../domain/models/produto.dart';
import '../../../../../../domain/models/repository/produtos_repository/produtos_repository.dart';

class EditProductCubit extends Cubit<EditProductState> {
  final ProdutoRepository produtoRepository;
  EditProductCubit(
    this.produtoRepository,
  ) : super(EditProductInitial());

  waitingEditProduct(String idProduto) {
    Produto produto = produtoRepository.byId(idProduto);
    emit(WaitingEditProduct(produto: produto));
  }

  setProduct(Produto produto) async {
    await produtoRepository.put(produto);
  }
}
