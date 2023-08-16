import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:projeto_desafio_flutter/domain/provider/produtos.dart';
import 'package:projeto_desafio_flutter/infrastructure/data.dart';

import '../../../domain/models/produto.dart';

final formatter = NumberFormat("#,##0.00", "pt_BR");

class AdicionarProduto extends StatefulWidget {
  const AdicionarProduto({Key? key}) : super(key: key);
  @override
  State<AdicionarProduto> createState() => _AdicionarProdutoState();
}

class _AdicionarProdutoState extends State<AdicionarProduto> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      Provider.of<Produtos>(context, listen: false)
          .put(Produto(id: uuid.v4(), nome: _formData['nome'], valor: _formData['valor']));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Produtos produtos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Produtos '), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
      body: Padding(
        padding: const EdgeInsets.all(30),
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
                      return 'Campo não aceita valores negativos!';
                    } else {
                      return null;
                    }
                  } catch (e) {
                    return 'Insira um número válido!';
                  }
                },
                decoration: const InputDecoration(
                    hintText: 'Insira o valor do produto',
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
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: _saveForm,
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar'),
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green))),
              Expanded(
                child: Consumer<Produtos>(builder: (context, produtos, child) {
                  return ListView.builder(
                      itemCount: produtos.count,
                      itemBuilder: (context, i) {
                        return ListTile(
                            subtitle: Text(
                              produtos.byIndex(i).id,
                              style: const TextStyle(fontSize: 14),
                            ),
                            title: Row(children: [
                              const Icon(Icons.pie_chart),
                              const Spacer(flex: 1),
                              Text(produtos.byIndex(i).nome),
                              const Spacer(flex: 1),
                              Text('R\$ ${formatter.format(produtos.byIndex(i).valor)}'),
                              const Spacer(flex: 1),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            ProdutoEdit(produtoSelecionado: produtos.byIndex(i))),
                                  );
                                },
                                child: Ink(
                                    child: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                )),
                              ),
                              const Spacer(flex: 1),
                              InkWell(
                                onTap: () {
                                  produtos.remove(produtos.byIndex(i));
                                },
                                child: Ink(
                                    child: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 85, 85, 85),
                                )),
                              ),
                            ]));
                      });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
class ProdutoEdit extends StatelessWidget {
  final Produto produtoSelecionado;
  final AdicionarProduto adicionarProdutos = AdicionarProduto();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, dynamic> _formData = {};
  ProdutoEdit({
    Key? key,
    required this.produtoSelecionado,
  }) : super(key: key);

  void _loadFormData(Produto produto) {
    _formData['id'] = produto.id;
    _formData['nome'] = produto.nome;
    _formData['valor'] = produto.valor;
  }

  void _saveForm() {
    final bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    Produto produto = produtoSelecionado;
    final Produtos produtos = Provider.of(context);
    _loadFormData(produto);
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Produto'), backgroundColor: const Color.fromARGB(221, 17, 17, 17)),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              readOnly: true,
              initialValue: produto.id,
              decoration: const InputDecoration(
                labelText: 'Id do Produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: _formData['nome'],
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
              initialValue: '${_formData['valor']}',
              validator: (value) {
                try {
                  var valor = double.tryParse(value!)!;
                  if (valor < 0) {
                    return 'Campo não aceita valores negativos!';
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
                onPressed: () {
                  _saveForm();
                  produto.nome = _formData['nome'];
                  produto.valor = _formData['valor'];
                  produtos.put(produto);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.save),
                label: const Text('Salvar'),
                style: const ButtonStyle()),
          ]),
        ),
      ),
    );
  }
}
