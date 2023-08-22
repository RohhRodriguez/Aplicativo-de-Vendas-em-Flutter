import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';
import '../../../../application/cubit/cadastro_cubit/cadastro_p/product_list/produto_list_cubit.dart';
import '../../../../domain/models/produto.dart';
import '../../../../domain/models/repository/produtos_repository/produtos_repository.dart';
import 'lista_products.dart';

//valueObject
class AdicionarProduto extends StatelessWidget {
  final ProdutoListCubit produtoListCubit = ProdutoListCubit(GetIt.instance<ProdutoRepository>());
  AdicionarProduto({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      produtoListCubit.addProduct(Produto(id: uuid.v4(), nome: _formData['nome'], valor: _formData['valor']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastrar Produto'), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
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
                  validator: (value) {
                    try {
                      var valor = double.tryParse(value!)!;
                      if (valor < 0) {
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
                    var valor = double.parse(value!);
                    _formData['valor'] = valor;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                    onPressed: _saveForm,
                    icon: const Icon(Icons.save),
                    label: const Text('Salvar'),
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue))),
                Expanded(
                  child: BlocProvider<ProdutoListCubit>(
                      create: (context) => produtoListCubit..generateListProducts(), child: ProductsList()),
                )
              ],
            ),
          ),
        ));
  }
}
