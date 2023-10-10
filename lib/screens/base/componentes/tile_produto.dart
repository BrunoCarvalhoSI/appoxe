import 'package:flutter/material.dart';

import '../../../componentes/custom_colors.dart';
import '../../../models/ModelProduto.dart';
import '../../../services/utils_services.dart';
import '../../tela_detalhes_produto.dart';

class ProdutoTile extends StatefulWidget {
  final ModelProduto produto;
  final void Function(GlobalKey) cartAnimationMethod;

  const ProdutoTile({
    Key? key,
    required this.produto,
    required this.cartAnimationMethod,
  }) : super(key: key);

  @override
  State<ProdutoTile> createState() => _ProdutoTileState();
}

class _ProdutoTileState extends State<ProdutoTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  IconData tileIcon =  Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async{
    setState(() =>tileIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() =>tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (c) {
                return DetalhesDoProduto(
                  produto: widget.produto,
                );
              },
            ));
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.produto.imageUrl,
                      child: Container(
                        key: imageGk,
                        child: Image.asset(
                          widget.produto.imageUrl,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    widget.produto.nome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(widget.produto.preco),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.colorAppVerde,
                        ),
                      ),
                      Text(
                        '/${widget.produto.undMedida}',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //BOTAO ADD CARRINHO
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () async {
                  switchIcon();
                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: CustomColors.colorAppVerde,

                  ),
                  child: Icon(
                    tileIcon,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}