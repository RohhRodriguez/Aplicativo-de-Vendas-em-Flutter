import '../../produto.dart';

abstract class IProdutoRepository {
  List<Produto> getAll();
  List<Produto> sortList();
  Produto byIndex(int i);
  Produto byId(String idProduto);
  put(Produto produto);
  remove(Produto produto);
}
