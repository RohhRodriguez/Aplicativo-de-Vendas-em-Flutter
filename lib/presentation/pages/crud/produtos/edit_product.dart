import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../application/cubit/cadastro_cubit/cadastro_p/edit_product/product_edit_cubit.dart';
import '../../../../application/cubit/cadastro_cubit/cadastro_p/edit_product/product_edit_state.dart';
import '../../../../domain/models/produto.dart';
import '../../../../domain/models/repository/produtos_repository/produtos_repository.dart';

class ProductEdit extends StatelessWidget {
  final EditProductCubit editProductCubit = EditProductCubit(GetIt.instance<ProdutoRepository>());
  final String idProduto;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};
  ProductEdit({
    Key? key,
    required this.idProduto,
  }) : super(key: key);

  void _saveForm(Produto produto) {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      produto.nome = _formData['nome'];
      produto.valor = _formData['valor'];
      editProductCubit.setProduct(produto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProductCubit>(
      create: (context) => editProductCubit..waitingEditProduct(idProduto),
      child: BlocBuilder<EditProductCubit, EditProductState>(
        builder: (context, state) {
          if (state is WaitingEditProduct) {
            return Scaffold(
                appBar: AppBar(
                    title: const Text('Editar Produto '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
                body: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        readOnly: true,
                        initialValue: state.produto.id,
                        decoration: const InputDecoration(
                          labelText: 'Id do Produto',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: state.produto.nome,
                        validator: (value) {
                          if (value != null && value.trim().length < 3) {
                            return 'Insira mais de 3 caracteres';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Insira o nome do Produto',
                            labelText: 'Nome do Produto',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
                        onSaved: (value) {
                          _formData['nome'] = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: '${state.produto.valor}',
                        validator: (value) {
                          try {
                            var valor = double.tryParse(value!)!;
                            if (value.trim().isEmpty && valor.isNaN && valor > 100) {
                              return 'Numero de caracteres menor do que o permitido!';
                            } else if (valor.isNaN) {
                              return 'Insira um valor positivo!';
                            } else {
                              return null;
                            }
                          } catch (e) {
                            return 'Insira um número válido!';
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: 'Insira o valor do Produto',
                            labelText: 'Valor do Produto',
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 5))),
                        onSaved: (value) {
                          var valor = double.tryParse(value!)! + 0.00;
                          _formData['valor'] = valor;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            _saveForm(state.produto);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.save),
                          label: const Text('Salvar'),
                          style: const ButtonStyle()),
                    ]),
                  ),
                ));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// lifecycle