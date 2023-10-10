import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';
import 'package:oxesushi_v1/config/mock_dados.dart' as mock;
import 'package:oxesushi_v1/screens/carrinho/componentes/tile_carrinho.dart';
import 'package:oxesushi_v1/services/utils_services.dart';

import '../../models/ModelItemCarrinho.dart';
import '../../widgets/payment_dialog.dart';

class TelaCarrinho extends StatefulWidget {
  TelaCarrinho({Key? key}) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  final UtilsServices utilsServices = UtilsServices();

  void removerItemCarrinho(ModelItemCarrinho itemCarrinho) {
    setState(() {
      mock.itensCarrinho.remove(itemCarrinho);
      utilsServices.showToast(message: '${itemCarrinho.item.nome} removido do carrinho ');

    });
  }

  double precoTotalCarrinho() {
    double total = 0;
    for (var item in mock.itensCarrinho) {
      total += item.precoTotal();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mock.itensCarrinho.length,
              itemBuilder: (_, index) {
                return CarrinhoTile(
                  itemCarrinho: mock.itensCarrinho[index],
                  remove: removerItemCarrinho,
                  atualizarTotalCarrinho: (qtd) {
                    if (qtd == 0) {
                      removerItemCarrinho(mock.itensCarrinho[index]);
                    } else {
                      setState(
                          () => mock.itensCarrinho[index].quantidade = qtd);
                    }
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            //VALOR TOTAL DO CARRINHO
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total geral",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(precoTotalCarrinho()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.colorAppVerde,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.colorAppVerde,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      bool result = await mostrarConfirmarPedido();
                      if (result) {
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              pedido: mock.pedidos[4],
                            );
                          },
                        );
                      }else{
                        utilsServices.showToast(message: 'Pedido não confirmado',isError: true,);
                      }
                    },
                    child: const Text(
                      "Concluir pedido",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> mostrarConfirmarPedido() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Confirmação"),
          content: const Text("Deseja concluir o pedido ?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Não"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.colorAppVerde,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                "Sim",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
    if (result == true) {
      // Concluir pedido
      return result;
    } else {
      // Não concluir pedido
      return result;
    }
  }
}
