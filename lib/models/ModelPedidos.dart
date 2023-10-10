// ignore: file_names
import '../models/ModelItemCarrinho.dart';

class ModelPedido {
  String id;
  DateTime dataCriacao;
  DateTime validadeQRCode;
  List<ModelItemCarrinho> itensPedido;
  String statusPedido;
  String statusPagamento;
  String copyAndPaste;
  double total;

  ModelPedido({
    required this.id,
    required this.dataCriacao,
    required this.validadeQRCode,
    required this.itensPedido,
    required this.statusPedido,
    required this.statusPagamento,
    required this.copyAndPaste,
    required this.total,
  });
}
