import 'package:flutter/material.dart';
import 'package:mais_receitas/data/register_user.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/login_screen.dart';

import '../classes/my_dialog.dart';
import '../widgets/main_button.dart';
import '../widgets/my_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 268,
                          width: 237,
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/images/logo.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 72,
                    // ),
                    MyTextField(
                      controller: _nameController,
                      hintText: "Nome",
                      icon: const Icon(
                        Icons.badge,
                        color: MyColors.primarydark,
                      ),
                    ),
                    MyTextField(
                      controller: _lastNameController,
                      hintText: "Sobrenome",
                      icon: const Icon(
                        Icons.badge,
                        color: MyColors.primarydark,
                      ),
                    ),
                    MyTextField(
                      controller: _emailController,
                      hintText: "E-mail",
                      icon: const Icon(
                        Icons.alternate_email,
                        color: MyColors.primarydark,
                      ),
                    ),
                    // SizedBox(
                    //   height: 36,
                    // ),
                    MyTextField(
                      controller: _passwordController,
                      hintText: "Senha",
                      isObscure: true,
                      icon: const Icon(
                        Icons.key,
                        color: MyColors.primarydark,
                      ),
                    ),
                    MyTextField(
                      controller: _passwordConfirmationController,
                      hintText: "Confirme a Senha",
                      isObscure: true,
                      icon: const Icon(
                        Icons.key,
                        color: MyColors.primarydark,
                      ),
                    ),
                    //  SizedBox(
                    //   height: 80,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MainButton(
                          labelText: "CADASTRAR",
                          buttonPressed: () async {
                            if (_passwordController.text ==
                                _passwordConfirmationController.text) {
                              await registerUser(
                                _nameController.text,
                                _lastNameController.text,
                                _emailController.text.trim(),
                                _passwordController.text,
                              );
                            } else {
                              myDialog(
                                context,
                                'ERRO:',
                                'As senhas não conferem!',
                                'OK',
                                () => Navigator.pop(context),
                              );
                            }
                            return myDialog(
                              context,
                              "SUCESSO",
                              "Usuário criado!",
                              "OK",
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
