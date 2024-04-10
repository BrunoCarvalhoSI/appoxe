import '../models/ModelPedidos.dart';
import '../models/ModelUsuario.dart';
import '../models/ModelItemCarrinho.dart';
import '../models/ModelProduto.dart';

ModelProduto niguiriSalmao = ModelProduto(
  descricao: 'Arroz com fatia de Salmão',
  imageUrl: 'imagens/imagens_produtos/niguiriTransparente.png',
  nome: "Niguiri de Salmão",
  preco: 3.50,
  undMedida: "und",id: '9'
);
ModelProduto niguiriBarrigaSalmao = ModelProduto(
  descricao: 'Arroz com fatia de Salmão Maçaricado',
  imageUrl: 'imagens/imagens_produtos/niguiriBarriga.png',
  nome: "Niguiri Barriga",
  preco: 3.00,
  undMedida: "und",id: '8'
);
ModelProduto hotRool = ModelProduto(
  descricao: 'Salmão,Camarão,Kani,Arroz na massinha',
  imageUrl: 'imagens/imagens_produtos/hotRool.png',
  nome: "Hot Rool",
  preco: 2.00,
  undMedida: "und",id: '7'
);
ModelProduto hotSalmao = ModelProduto(
  descricao: 'Salmão',
  imageUrl: 'imagens/imagens_produtos/hotCamarao.png',
  nome: "Hot Salmão",
  preco: 2.50,
  undMedida: "und",id: '6'
);
ModelProduto hotKani = ModelProduto(
  descricao: 'Kani',
  imageUrl: 'imagens/imagens_produtos/hotCamarao.png',
  nome: "Hot Kani",
  preco: 2.00,
  undMedida: "und",id: '5'
);
ModelProduto comboHotCamarao = ModelProduto(
  descricao: '18 unidades de Combo hot Camarão',
  imageUrl: 'imagens/imagens_produtos/hotSalmao.png',
  nome: "Hot Camarão",
  preco: 17.00,
  undMedida: "und",id: '4'
);
ModelProduto comboHot30Pecas = ModelProduto(
  descricao: '10 hot salmão, 10 hot rool, 10 hot kani',
  imageUrl: 'imagens/imagens_produtos/hot30.png',
  nome: "Hot 30 Peças",
  preco: 55.00,
  undMedida: "und",id: '3'
);
ModelProduto comboPastel = ModelProduto(
  descricao: 'Combo de Pastel',
  imageUrl: 'imagens/imagens_produtos/hotCamarao.png',
  nome: "Combo de Pastel",
  preco: 22.00,
  undMedida: "und",id: '2'
);
ModelProduto comboNutella = ModelProduto(
  descricao: 'Nutella',
  imageUrl: 'imagens/imagens_produtos/hotCamarao.png',
  nome: "Combo de Nutella",
  preco: 17.00,
  undMedida: "und",id: '1',
);

ModelUsuario usuario = ModelUsuario(
  celular: '79 9 9919-4590',
  cpf: '023.247.305.62',
  email: 'brunocarvalhoifs@gmail.com',
  nome: 'Bruno Carvalho',
  senha: "123546",
  id: '1',
);

List<ModelProduto> listaProdutos = [
  niguiriSalmao,
  niguiriBarrigaSalmao,
  hotRool,
  hotSalmao,
  hotKani,
  comboHotCamarao,
  comboHot30Pecas,
  comboPastel,
  comboNutella,
];

List<String> categorias = [
  'Cru',
  'Frito',
  'Combos',
  'Yakisoba',
  'Temaki',
  'Promoções',
];

List<ModelItemCarrinho> itensCarrinho = [
  ModelItemCarrinho(item: niguiriSalmao, quantidade: 2),
  ModelItemCarrinho(item: niguiriBarrigaSalmao, quantidade: 3),
  ModelItemCarrinho(item: comboNutella, quantidade: 5),
  ModelItemCarrinho(item: comboHot30Pecas, quantidade: 4),
  ModelItemCarrinho(item: hotSalmao, quantidade: 1),
  ModelItemCarrinho(item: hotRool, quantidade: 1),
];

//final Map<String, int> todosStatus = <String, int>{
// 'Pedido em analise': 0,
//'Pedido recusado': 1,
//'Pedido aceito': 2,
//'Pix vencido': 3,
//'Pagamento efetuado': 4,
//'Em produção': 5,
//'Enviado': 6,
//'Entregue': 7,
//'Pedido cancelado': -1,
//'Pagamento devolvido': -2,
// };

List<ModelPedido> pedidos = [
  //Pedido 1
  ModelPedido(
    id: "FBHK-1025",
    total: 50.0,
    copyAndPaste: "dsasdaadsd",
    statusPedido: "Pedido cancelado",
    statusPagamento: "Pagamento em cartão",
    dataCriacao: DateTime.parse(
      '2023-01-01 10:05:10.250',
    ),
    validadeQRCode: DateTime.parse(
      '2023-01-01 11:11:11.250',
    ),
    itensPedido: [
      ModelItemCarrinho(item: comboHot30Pecas, quantidade: 5),
      ModelItemCarrinho(item: comboPastel, quantidade: 1),
      ModelItemCarrinho(item: niguiriBarrigaSalmao, quantidade: 10),
      ModelItemCarrinho(item: niguiriSalmao, quantidade: 20),
      ModelItemCarrinho(item: hotKani, quantidade: 10),
      ModelItemCarrinho(item: hotRool, quantidade: 8),
      ModelItemCarrinho(item: hotRool, quantidade: 8),
      ModelItemCarrinho(item: hotRool, quantidade: 8),
      ModelItemCarrinho(item: hotKani, quantidade: 10),
      ModelItemCarrinho(item: hotRool, quantidade: 8),
      ModelItemCarrinho(item: hotRool, quantidade: 8),
      ModelItemCarrinho(item: hotRool, quantidade: 8),
    ],
  ),
  //PEDIDO 2
  ModelPedido(
    id: "ASKD-0521",
    total: 50.0,
    copyAndPaste: "dsasdaadsd",
    statusPedido: "Entregue",
    statusPagamento: "PAGO via pix",
    dataCriacao: DateTime.parse(
      '2024-01-01 10:05:10.250',
    ),
    validadeQRCode: DateTime.parse(
      '2024-01-01 11:11:11.250',
    ),
    itensPedido: [
      ModelItemCarrinho(item: comboHot30Pecas, quantidade: 5),
      ModelItemCarrinho(item: comboPastel, quantidade: 1),
      ModelItemCarrinho(item: niguiriBarrigaSalmao, quantidade: 10),
      ModelItemCarrinho(item: niguiriSalmao, quantidade: 20),
      ModelItemCarrinho(item: hotKani, quantidade: 10),
      ModelItemCarrinho(item: hotRool, quantidade: 2),
      ModelItemCarrinho(item: hotRool, quantidade: 3),
      ModelItemCarrinho(item: hotRool, quantidade: 4),
      ModelItemCarrinho(item: hotRool, quantidade: 8),
    ],
  ),
  //PEDIDO 3
  ModelPedido(
    id: "LKD-0521",
    total: 50.0,
    copyAndPaste: "dsasdaadsd",
    statusPedido: 'Pedido aceito',
    statusPagamento: 'Pagamento em dinheiro',
    dataCriacao: DateTime.parse(
      '2023-01-01 10:05:10.250',
    ),
    validadeQRCode: DateTime.parse(
      '2024-01-01 11:11:11.250',
    ),
    itensPedido: [
      ModelItemCarrinho(item: comboHot30Pecas, quantidade: 5),
      ModelItemCarrinho(item: comboPastel, quantidade: 1),
      ModelItemCarrinho(item: niguiriBarrigaSalmao, quantidade: 10),
      ModelItemCarrinho(item: niguiriSalmao, quantidade: 20),
    ],
  ),
  //PEDIDO 4
  ModelPedido(
    id: "LKD-0521",
    total: 50.0,
    copyAndPaste: "dsasdaadsd",
    statusPedido: 'Pedido aceito',
    statusPagamento: 'Pix pendente',
    dataCriacao: DateTime.parse(
      '2023-01-01 10:05:10.250',
    ),
    validadeQRCode: DateTime.parse(
      '2024-05-08 16:11:11.250',
    ),
    itensPedido: [
      ModelItemCarrinho(item: comboHot30Pecas, quantidade: 5),
      ModelItemCarrinho(item: comboPastel, quantidade: 1),
      ModelItemCarrinho(item: niguiriBarrigaSalmao, quantidade: 10),
      ModelItemCarrinho(item: niguiriSalmao, quantidade: 20),
    ],
  ),
  //PEDIDO 5
  ModelPedido(
    id: "LKD-0521",
    total: 50.0,
    copyAndPaste: "dsasdaadsd",
    statusPedido: 'Em produção',
    statusPagamento: 'Pix vencido',
    dataCriacao: DateTime.parse(
      '2023-01-01 10:05:10.250',
    ),
    validadeQRCode: DateTime.parse(
      '2023-03-24 11:11:11.250',
    ),
    itensPedido: [
      ModelItemCarrinho(item: comboHot30Pecas, quantidade: 5),
      ModelItemCarrinho(item: comboPastel, quantidade: 1),
      ModelItemCarrinho(item: niguiriBarrigaSalmao, quantidade: 10),
      ModelItemCarrinho(item: niguiriSalmao, quantidade: 20),
    ],
  ),
];
