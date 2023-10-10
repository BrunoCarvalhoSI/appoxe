import 'ModelProduto.dart';

class ModelItemCarrinho {
  ModelProduto item;
  int quantidade;

  ModelItemCarrinho({
    required this.item,
    required this.quantidade,
  });

  double precoTotal() => item.preco * quantidade;
}
