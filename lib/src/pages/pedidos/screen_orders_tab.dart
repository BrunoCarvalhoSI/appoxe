import 'package:flutter/material.dart';
import '/src/config/mock_dados.dart' as mock;

import 'componentes/tile_pedido.dart';

class TelaPedidos extends StatelessWidget {
  const TelaPedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pedidos"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => PedidoTile(pedido: mock.pedidos[index]),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemCount: mock.pedidos.length,
      ),
    );
  }
}
