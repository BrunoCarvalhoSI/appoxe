// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/src/pages/auth/controller/auth_controller.dart';
import '../../../pages_routes/app_pages.dart';
import '../../../componentes/custom_colors.dart';
import '../../../services/utils_services.dart';
import '../../../componentes/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  // Controlador de campos
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              //CONTAINER SUPERIOR
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    //IMAGEM OXE SUSHI
                    image: DecorationImage(
                      image: AssetImage('imagens/imagens_oxesushi/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //BOTAO CARDAPIO
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: SizedBox(
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 3,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        shadowColor: Colors.white,
                        backgroundColor: CustomColors.colorAppVermelho,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: CustomColors.colorAppVermelho,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(
                        Icons.restaurant_menu,
                        color: Colors.white,
                        size: 35,
                      ),
                      label: const Text(
                        "CARDÁPIO",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              //FORMULARIO
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                //DECORACAO DO CONTAINER INFERIOR
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //EMAIL
                      CustomTextField(
                        icon: Icons.email,
                        controller: emailController,
                        label: "Email",
                        validator: (email) {
                          if (email == null || email == '') {
                            return 'Digite seu email';
                          } else if (!email.isEmail) {
                            return 'Email invalido';
                          }
                          return null;
                        },
                      ),
                      //SENHA
                      CustomTextField(
                        controller: passwordController,
                        icon: Icons.lock,
                        label: "Senha",
                        isSecret: true,
                        validator: (password) {
                          if (password == null || password == '') {
                            return 'Digite sua senha';
                          } else if (password.length < 5) {
                            return 'Senha muito curta';
                          }
                          return null;
                        },
                      ),
                      //BOTAO ENTRAR
                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.colorAppTema,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                FocusScope.of(context).unfocus();

                                if (_formKey.currentState!.validate()) {
                                  String email = emailController.text;
                                  String password =
                                      passwordController.text;

                                  authController.signIn(
                                      email: email, password: password);
                                }
                              },
                              child: authController.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: CustomColors.colorAppTema,
                                    )
                                  : const Text(
                                      "Entrar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                            );
                          },
                        ),
                      ),
                      //BOTAO ESQUECI A SENHA
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Esqueci a Senha",
                            style: TextStyle(
                              color: CustomColors.colorAppVermelho,
                            ),
                          ),
                        ),
                      ),
                      //DIVISOR OU
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.black.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text("Ou"),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.black.withAlpha(90),
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //BOTAO CRIAR CONTA
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              width: 2,
                              color: CustomColors.colorAppTema,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(PagesRoutes.registerUserRoute);
                          },
                          child: Text(
                            "Criar Conta",
                            style: TextStyle(
                                fontSize: 18, color: CustomColors.colorAppTema),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
