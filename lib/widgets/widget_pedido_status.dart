import 'package:flutter/material.dart';
import '/componentes/custom_colors.dart';

class StatusPedidoWidget extends StatelessWidget {
  final String statusPedido;
  final String statusPagamento;
  final bool estaVencido;

  final Map<String, int> todosStatus = <String, int>{
    'Pedido em analise': 0,
    'Pedido recusado': 1,
    'Pedido aceito': 2,
    'Em produção': 3,
    'Enviado': 4,
    'Entregue': 5,
    'Pedido cancelado': 6,
  };

  final Map<String, int> todosStatusPagamento = <String, int>{
    'Pagamento em dinheiro': -1,
    'Pagamento em cartão': -2,
    'Pix pendente': -3,
    'Pix vencido': -4,
    'Pix devolvido': -5,
    'PAGO via pix': -6,
  };

  int? get statusPedidoAtual => todosStatus[statusPedido];
  int? get statusPagamentoAtual => todosStatusPagamento[statusPagamento];

  StatusPedidoWidget({
    Key? key,
    required this.estaVencido,
    required this.statusPedido,
    required this.statusPagamento,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...[
          _StatusDoPagamento(
            isActive: statusPagamentoAtual == -1,
            titulo: "Pagamento em dinheiro",backgroundcolor: Colors.green
          ),
           _CustomDivisorStatus(),
          _StatusDoPagamento(
            isActive: statusPagamentoAtual == -2,
            titulo: "Pagamento em cartão",backgroundcolor: Colors.green
          ),
           _CustomDivisorStatus(),
          _StatusDoPagamento(
            isActive: statusPagamentoAtual == -3,
            titulo: "Pix pendente",backgroundcolor: Colors.green
          ),
           _CustomDivisorStatus(),
          _StatusDoPagamento(
            isActive: statusPagamentoAtual == -4,
            titulo: "Pix vencido",backgroundcolor: Colors.green
          ),
           _CustomDivisorStatus(),
          _StatusDoPagamento(
            isActive: statusPagamentoAtual == -5,
            titulo: "Pix devolvido",backgroundcolor: Colors.green
          ),
           _CustomDivisorStatus(),
          _StatusDoPagamento(
            isActive: statusPagamentoAtual == -6,
            titulo: "PAGO via pix",
            backgroundcolor: Colors.green,
          ),
        ],
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            top: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black.withAlpha(90),
                  thickness: 2,
                ),
              ),
            ],
          ),
        ),
        ...[
          //const _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusPedidoAtual == 0,
            titulo: "Pedido em analise",backgroundcolor: Colors.green
          ),
           _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusPedidoAtual == 1,
            titulo: "Pedido recusado",
            backgroundcolor: Colors.red,
          ),
           _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusPedidoAtual == 2,
            titulo: "Pedido aceito",backgroundcolor: Colors.green
          ),
          const _CustomDivisorStatus(),
           _StatusDoPedido(
            isActive: statusPedidoAtual == 3,
            titulo: "Em produção", backgroundcolor: Colors.green,
          ),
           _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusPedidoAtual == 4,
            titulo: "Enviado",backgroundcolor: Colors.green,
          ),
           _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusPedidoAtual == 5,
            titulo: "Entregue",
            backgroundcolor: Colors.blue,
          ),
           _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusPedidoAtual == 6,
            titulo: "Pedido cancelado",
            backgroundcolor: Colors.red,
          ),
        ]
      ],
    );
  }
}

class _StatusDoPedido extends StatelessWidget {
  final bool isActive;
  final String titulo;
  final Color backgroundcolor;

  const _StatusDoPedido({
    Key? key,
    required this.isActive,
    required this.titulo,
    required this.backgroundcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DOT bolinha com os status
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.colorAppVerde,
            ),
            color: isActive
                ? CustomColors.colorAppVerde
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        //Texto do status
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}

class _StatusDoPagamento extends StatelessWidget {
  final bool isActive;
  final String titulo;
  final Color backgroundcolor;

  const _StatusDoPagamento({
    Key? key,
    required this.isActive,
    required this.titulo,
    required this.backgroundcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DOT bolinha com os status
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.colorAppVerde,
            ),
            color: isActive
                ? CustomColors.colorAppVerde
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        //Texto do status
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}

class _CustomDivisorStatus extends StatelessWidget {
  const _CustomDivisorStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 8,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}
