import 'package:flutter/material.dart';
import 'package:mais_receitas/controller/get_user_registered.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/login_screen.dart';
import 'package:mais_receitas/widgets/my_password_field.dart';

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
                      textInputActionField: TextInputAction.next,
                      controller: _nameController,
                      hintText: "Nome",
                      icon: const Icon(
                        Icons.badge,
                        color: MyColors.primarydark,
                      ),
                    ),
                    MyTextField(
                      textInputActionField: TextInputAction.next,
                      controller: _lastNameController,
                      hintText: "Sobrenome",
                      icon: const Icon(
                        Icons.badge,
                        color: MyColors.primarydark,
                      ),
                    ),
                    MyTextField(
                      textInputActionField: TextInputAction.next,
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
                    MyPasswordField(
                      textInputActionField: TextInputAction.next,
                      controller: _passwordController,
                      hintText: "Senha",
                      icon: const Icon(
                        Icons.key,
                        color: MyColors.primarydark,
                      ),
                    ),
                    MyPasswordField(
                      textInputActionField: TextInputAction.done,
                      controller: _passwordConfirmationController,
                      hintText: "Confirme sua Senha",
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
                          labelText: "VOLTAR",
                          buttonPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          ),
                        ),
                        MainButton(
                          labelText: "CADASTRAR",
                          buttonPressed: () async {
                            if ((_nameController.text.isNotEmpty == true &&
                                    _lastNameController.text.isNotEmpty == true &&
                                    _emailController.text.isNotEmpty == true &&
                                    _passwordController.text.isNotEmpty ==
                                        true &&
                                    _passwordConfirmationController
                                            .text.isNotEmpty ==
                                        true) &&
                                _passwordController.text ==
                                    _passwordConfirmationController.text) {
                              return 
                                await getUserRegistered(
                                  _nameController.text,
                                  _lastNameController.text,
                                  _emailController.text.trim(),
                                  _passwordController.text,
                                  context,
                                );
                            }
                            if (_nameController.text.isNotEmpty != true ||
                                _lastNameController.text.isNotEmpty != true ||
                                _emailController.text.isNotEmpty != true ||
                                _passwordController.text.isNotEmpty != true) {
                              return myDialog(
                                context,
                                "ERRO:",
                                "Todos os campos devem ser preenchidos",
                                "OK",
                                () => Navigator.pop(context),
                              );
                            }
                            if (_passwordController.text !=
                                _passwordConfirmationController.text) {
                              return myDialog(
                                context,
                                'ERRO:',
                                'As senhas não conferem!',
                                'OK',
                                () => Navigator.pop(context),
                              );
                            }
                          },
                        ),
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
