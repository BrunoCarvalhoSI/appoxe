import 'package:flutter/material.dart';

import '../../componentes/custom_colors.dart';
import '../carrinho/tela_carrinho_tab.dart';
import '../base/tela_home_tab.dart';
import '../pedidos/tela_pedidos_tab.dart';
import '../perfil/tela_perfil_tab.dart';

class TelaBase extends StatefulWidget {
  const TelaBase({Key? key}) : super(key: key);

  @override
  State<TelaBase> createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase> {
  int currentIndex = 0;
  final pageControler = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageControler,
        children: [
          const TelaHome(),
          TelaCarrinho(),
          const TelaPedidos(),
          const TelaPerfil(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageControler.jumpToPage(index);
            // pageControler.animateToPage(
            //   index,
            //   duration: const Duration(milliseconds: 800),
            //   curve: Curves.linear,
            // );
          });
        },
        selectedItemColor: CustomColors.colorAppVermelho,
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        //unselectedItemColor: Colors.white.withAlpha(100),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          //BottomNavigationBarItem(
          //  icon: ImageIcon(
          //    AssetImage('imagens/minhaLogo.png'),
          //    size: 20,
          //  ),
          //  label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Carrinho",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Pedidos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
