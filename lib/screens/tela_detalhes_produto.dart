import 'package:flutter/material.dart';
import 'package:oxesushi_v1/services/utils_services.dart';
import 'package:oxesushi_v1/widgets/widget_quantidade.dart';
import '../componentes/custom_colors.dart';
import '../models/ModelProduto.dart';

class DetalhesDoProduto extends StatefulWidget {
  final ModelProduto produto;

  const DetalhesDoProduto({
    Key? key,
    required this.produto,
  }) : super(key: key);

  @override
  State<DetalhesDoProduto> createState() => _DetalhesDoProdutoState();
}

class _DetalhesDoProdutoState extends State<DetalhesDoProduto> {
  final UtilsServices utilsServices = UtilsServices();

  int qtdDoCarrinho = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorAppTema,
      body: Stack(
        children: [
          //Conteudo todo do produto
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.produto.imageUrl,
                  child: Image.asset(widget.produto.imageUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //nome - quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.produto.nome,
                              maxLines: 2,
                              //coloca a ... caso o nome seja grande demais ja que a coluna ta limitada a 2 linhas
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          WidgetQuantidade(
                            value: qtdDoCarrinho,
                            //quantityController: TextEditingController(text: qtdDoCarrinho.toString()),
                            suffixText: widget.produto.undMedida,
                            result: (qtd) {
                              setState(() {
                                qtdDoCarrinho = qtd;
                              });
                            },
                          )
                        ],
                      ),
                      //Preco
                      Text(
                        utilsServices.priceToCurrency(widget.produto.preco),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.colorAppVerde,
                        ),
                      ),
                      //descricao um pouco abaixo do preço com 3 linhas no max
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          widget.produto.descricao,
                          maxLines: 3,
                          style: const TextStyle(
                            height: 1.5,
                          ),
                        ),
                      ),
                      //Todas os componentes do produto com barra de rolagem
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: SingleChildScrollView(),
                        ),
                      ),
                      //Botao Adicionar Carrinho FIXO
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: CustomColors.colorAppVerde,
                          ),
                          onPressed: () {},
                          label: const Text(
                            "Adicionar ao carrinho",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                      //Radio Buttom - Array de Radios Buttom
                      //Check Box - Array de check Box
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
