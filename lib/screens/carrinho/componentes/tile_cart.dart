import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';
import 'package:oxesushi_v1/models/ModelItemCarrinho.dart';
import 'package:oxesushi_v1/services/utils_services.dart';
import 'package:oxesushi_v1/widgets/widget_quantidade.dart';

class CarrinhoTile extends StatefulWidget {
  final ModelItemCarrinho itemCarrinho;

  final Function(ModelItemCarrinho) remove;
  final Function(int) atualizarTotalCarrinho;

  const CarrinhoTile({
    Key? key,
    required this.itemCarrinho,
    required this.remove,
    required this.atualizarTotalCarrinho,
  }) : super(key: key);

  @override
  State<CarrinhoTile> createState() => _CarrinhoTileState();
}

class _CarrinhoTileState extends State<CarrinhoTile> {
  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        //Imagem
        leading: Image.asset(
          widget.itemCarrinho.item.imageUrl,
          height: 60,
          width: 60,
        ),
        //Titulo
        title: Text(
          widget.itemCarrinho.item.nome,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        //Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.itemCarrinho.precoTotal()),
          style: TextStyle(
            color: CustomColors.colorAppVerde,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Quantidade
        trailing: WidgetQuantidade(
          suffixText: widget.itemCarrinho.item.undMedida,
          value: widget.itemCarrinho.quantidade,
          //quantityController: TextEditingController(text: widget.itemCarrinho.quantidade.toString()),
          result: widget.atualizarTotalCarrinho,
          isRemovable: true,
        ),
      ),
    );
  }
}
