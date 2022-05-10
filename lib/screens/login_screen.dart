import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/controller/home_controller.dart';
import 'package:mais_receitas/controller/get_recipes_repository.dart';
import 'package:mais_receitas/controller/get_user_signed_in.dart';
import 'package:mais_receitas/data/user_model.dart';
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
  final controller = HomeController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Box<String> favoriteRecipeBox; 

  @override
  void initState() {
    setState(() {
      controller.start();
    });
    super.initState();
  }

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
                            return await getUserSignedIn(
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
                        buttonPressed:  
                        () => Navigator.push(
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
