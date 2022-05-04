import 'package:flutter/material.dart';
import 'package:mais_receitas/design/my_colors.dart';

import '../widgets/main_button.dart';
import '../widgets/my_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  // SizedBox(
                  //   height: 72,
                  // ),
                  MyTextField(
                    controller: _nameController,
                    hintText: "Nome",
                    icon: Icon(
                      Icons.badge,
                      color: MyColors.primarydark,
                    ),
                  ),
                      MyTextField(
                    controller: _lastNameController,
                    hintText: "Sobrenome",
                    icon: Icon(
                      Icons.badge,
                      color: MyColors.primarydark,
                    ),
                  ),
                      MyTextField(
                    controller: _emailController,
                    hintText: "E-mail",
                    icon: Icon(
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
                    icon: Icon(
                      Icons.key,
                      color: MyColors.primarydark,
                    ),
                  ),
                  MyTextField(
                    controller: _passwordController,
                    hintText: "Confirme a Senha",
                    isObscure: true,
                    icon: Icon(
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
                      MainButton(labelText: "CADASTRAR")
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