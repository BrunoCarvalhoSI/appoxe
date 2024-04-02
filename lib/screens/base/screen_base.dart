import 'package:flutter/material.dart';

import '../../componentes/custom_colors.dart';
import '../carrinho/screen_cart_tab.dart';
import '../pedidos/tela_pedidos_tab.dart';
import '../perfil/screen_perfil_tab.dart';

class ScreenBase extends StatefulWidget {
  const ScreenBase({Key? key}) : super(key: key);

  @override
  State<ScreenBase> createState() => _ScreenBaseState();
}

class _ScreenBaseState extends State<ScreenBase> {
  int currentIndex = 0;
  final pageControler = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageControler,
        children: [
          const ScreenBase(),
          ScreenCart(),
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
