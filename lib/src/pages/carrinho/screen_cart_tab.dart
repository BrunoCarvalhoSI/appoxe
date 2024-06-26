import 'package:flutter/material.dart';
import '/src/componentes/custom_colors.dart';
import '/src/config/mock_dados.dart' as mock;
import '/src/services/utils_services.dart';

import '../../models/model_cart_item.dart';
import '../../componentes/payment_dialog.dart';
import 'componentes/tile_cart.dart';

class ScreenCart extends StatefulWidget {
  ScreenCart({Key? key}) : super(key: key);
  final UtilsServices utilsServices = UtilsServices();

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  final UtilsServices utilsServices = UtilsServices();

  void removerItemCarrinho(ModelItemCarrinho cartItem) {
    setState(() {
      mock.itensCarrinho.remove(cartItem);
      utilsServices.showToast(
          message: '${cartItem.item.nome} removido do carrinho ');
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
                      } else {
                        utilsServices.showToast(
                          message: 'Pedido não confirmado',
                          isError: true,
                        );
                      }
                    },
                    child: const Text(
                      "Concluir pedido",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
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
