import '../../../../infrastructure/data.dart';
import '../../produto.dart';
import 'i_produtos_repository.dart';

class ProdutoRepository implements IProdutoRepository {
  final Mock mock = Mock();

  @override
  Produto byIndex(int i) {
    return sortList().elementAt(i);
  }

  @override
  Produto byId(String idProduto) {
    Produto produto = getAll().firstWhere((element) => element.id == idProduto);
    return produto;
  }

  @override
  List<Produto> getAll() {
    return mock.produtos;
  }

  @override
  List<Produto> sortList() {
    final List<Produto> ordenado = getAll().toList();
    ordenado.sort((a, b) => a.nome.compareTo(b.nome));
    return ordenado;
  }

  @override
  put(Produto produto) {
    if (mock.produtos.contains(produto)) {
      mock.produtos.remove(produto);
      mock.produtos.add(produto);
    } else {
      mock.produtos.add(produto);
    }
  }

  @override
  remove(Produto produto) {
    mock.produtos.remove(produto);
  }
}
