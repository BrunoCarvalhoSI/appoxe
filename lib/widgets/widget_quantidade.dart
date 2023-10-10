import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';

class WidgetQuantidade extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  WidgetQuantidade({
    Key? key,
    required this.suffixText,
    required this.value,
    required this.result,
    this.isRemovable = false,
  }) : super(key: key) {
    // Instanciando o controlador do campo de texto com o valor inicial
    quantityController = TextEditingController(
      text: value.toString(),
    )..selection = TextSelection.collapsed(
        offset: value.toString().length,
      );

    // Adicionando um listener que é chamando sempre que o campo de texto é alterado
    // A ideia é verifiar se o campo está vazio ou igual a zero e se sim, trocar para "1"
    quantityController.addListener(() {
      final text = quantityController.text;
      if (text.isEmpty || text == '0') {
        quantityController.text = '1';
      }
    });
  }

  // Controlador que irá gerenciar o valor do campo de texto
  late final TextEditingController quantityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon:
                !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever,
            color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
            onPressed: () {
              // Comando para remover o teclado
              FocusScope.of(context).unfocus();

              if (value == 1 && !isRemovable) return;

              int resultCount = value - 1;
              result(resultCount);
            },
          ),
          // Widget para permitir que o campo texto cresça o suficiente para apresentar seu valor
          IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              // Campo de texto
              child: TextFormField(
                controller: quantityController,
                // Para que o teclado numérico seja apresentado
                keyboardType: TextInputType.number,
                // Para permitir apenas digitos numéricos
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                // Quando modificado o valor do campo de texto recebemos este novo valor aqui
                // Convertemos o valor porque o campo trabalha com String e o nosso Widget de quantidade com int
                onChanged: (value) => result(int.parse(value)),

                decoration: const InputDecoration(
                  // Retirando a borda
                  border: InputBorder.none,
                  // Para que o campo seja denso e sua altura seja reduzida
                  isDense: true,
                  // Para remover todo o espaçamento interno padrão do campo
                  contentPadding: EdgeInsets.zero,
                  // Adicionando o texto de sufixo
                  //suffixText: suffixText,
                ),
              ),
            ),
          ),
          _QuantityButton(
            icon: Icons.add,
            color: CustomColors.colorAppVerde,
            onPressed: () {
              // Comando para remover o teclado
              FocusScope.of(context).unfocus();
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
