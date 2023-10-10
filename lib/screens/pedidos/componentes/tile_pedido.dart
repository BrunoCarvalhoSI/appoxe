import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';
import 'package:oxesushi_v1/models/ModelPedidos.dart';
import 'package:oxesushi_v1/widgets/payment_dialog.dart';
import 'package:oxesushi_v1/widgets/widget_pedido_status.dart';
import 'package:oxesushi_v1/services/utils_services.dart';

import '../../../models/ModelItemCarrinho.dart';

class PedidoTile extends StatelessWidget {
  final ModelPedido pedido;

  PedidoTile({
    Key? key,
    required this.pedido,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          //CABECALHO DO PEDIDO
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido: ${pedido.id}',
                style: TextStyle(
                  color: CustomColors.colorAppVerde,
                ),
              ),
              Text(
                utilsServices.formatDateTime(pedido.dataCriacao),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //lista de itens
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 300,
                      child: ListView(
                        children: pedido.itensPedido.map(
                          (itemDoPedido) {
                            return _ItemDoPedidoWidget(
                              itemPedido: itemDoPedido,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  //Status do pedido
                  Expanded(
                    flex: 2,
                    child: StatusPedidoWidget(
                      statusPedido: pedido.statusPedido,
                      statusPagamento: pedido.statusPagamento,
                      estaVencido:
                          pedido.validadeQRCode.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            //TOTAL
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: "Total ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(pedido.total),
                  )
                ],
              ),
            ),
            //BOTAO DE PAGAMENTO
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: SizedBox(
                height: 40,
                child: Visibility(
                  visible: pedido.statusPagamento == 'Pix pendente' &&
                      pedido.statusPedido == 'Pedido aceito' &&
                      !pedido.validadeQRCode.isBefore(DateTime.now()),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.colorAppVerde,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return PaymentDialog(
                            pedido: pedido,
                          );
                        },
                      );
                    },
                    icon: Image.asset(
                      'imagens/imagens_app/pix.png',
                      height: 20,
                    ),
                    label: const Text("Ver QR Code Pix"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemDoPedidoWidget extends StatelessWidget {
  const _ItemDoPedidoWidget({
    Key? key,
    required this.itemPedido,
  }) : super(key: key);

  final ModelItemCarrinho itemPedido;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(
            '${itemPedido.quantidade} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              itemPedido.item.nome,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Text(
            UtilsServices().priceToCurrency(itemPedido.item.preco),
          )
        ],
      ),
    );
  }
}
