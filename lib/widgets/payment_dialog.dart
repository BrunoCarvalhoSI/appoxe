import 'package:flutter/material.dart';
import 'package:oxesushi_v1/models/ModelPedidos.dart';
import 'package:oxesushi_v1/services/utils_services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final ModelPedido pedido;

  PaymentDialog({Key? key, required this.pedido}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //CONTEUDO
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                //QR CODE
                QrImageView(
                  data: 'This is a simple QR code',
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                ),
                //VENCIMENTO
                Text(
                  "Vencimento: ${utilsServices.formatDateTime(pedido.validadeQRCode)}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                //TOTAL
                Text(
                  "Total: ${utilsServices.priceToCurrency(pedido.total)}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //BOTAO COPIA E COLA
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.green,
                      )),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.green,
                  ),
                  label: const Text(
                    "Pix Copia e Cola",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
