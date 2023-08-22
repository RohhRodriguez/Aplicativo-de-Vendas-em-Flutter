import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../application/cubit/cadastro_cubit/cadastro_p/product_list/produto_list_cubit.dart';
import '../../../../application/cubit/cadastro_cubit/cadastro_p/product_list/produto_list_state.dart';
import 'edit_product.dart';

class ProductsList extends StatelessWidget {
  final formatter = NumberFormat("#,##0.00", "pt_BR");
  ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdutoListCubit, ProductListState>(
      builder: (context, state) {
        if (state is SuccessListProduct) {
          return ListView.builder(
              itemCount: state.productList.length,
              itemBuilder: (context, i) {
                return ListTile(
                  subtitle: Text(
                    'Id: ${state.productList[i].id}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  title: Row(children: [
                    const Icon(Icons.pie_chart),
                    const SizedBox(width: 10),
                    Text(state.productList[i].nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(flex: 1),
                    Text('R\$ ${formatter.format(state.productList[i].valor)}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => ProductEdit(idProduto: state.productList[i].id)),
                        ).then((value) => context.read<ProdutoListCubit>().generateListProducts());
                      },
                      child: Ink(
                          child: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      )),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        context.read<ProdutoListCubit>().delete(state.productList[i]);
                      },
                      child: Ink(
                          child: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 85, 85, 85),
                      )),
                    ),
                  ]),
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
