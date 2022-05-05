import 'package:flutter/material.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/data/login_user.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/signup_screen.dart';
import 'package:mais_receitas/widgets/main_button.dart';
import 'package:mais_receitas/widgets/my_password_field.dart';
import 'package:mais_receitas/widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(
                    height: 72,
                  ),
                  MyTextField(
                    controller: _emailController,
                    hintText: "E-mail",
                    textInputActionField: TextInputAction.next,
                    icon: Icon(
                      Icons.alternate_email,
                      color: MyColors.primarydark,
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  MyPasswordField(
                    textInputActionField: TextInputAction.done,
                    controller: _passwordController,
                    hintText: "Senha",
                    icon: Icon(
                      Icons.key,
                      color: MyColors.primarydark,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MainButton(
                        labelText: "ENTRAR",
                        buttonPressed: () async {
                          if (_emailController.text.isNotEmpty == true &&
                              _passwordController.text.isNotEmpty == true) {
                            return await loginUser(
                              _emailController.text.trim(),
                              _passwordController.text,
                              context,
                            );
                          }
                          if (_emailController.text.isNotEmpty != true ||
                              _passwordController.text.isNotEmpty != true) {
                            return myDialog(
                              context,
                              "ERRO:",
                              "Todos os campos devem ser preenchidos",
                              "OK",
                              () => Navigator.pop(context),
                            );
                          }
                        },
                      ),
                      MainButton(
                        labelText: "CADASTRAR",
                        buttonPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
