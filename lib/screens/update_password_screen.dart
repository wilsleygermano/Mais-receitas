import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/controller/update_password.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/profile_screen.dart';
import 'package:mais_receitas/widgets/main_button.dart';

import '../widgets/my_password_field.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  late Box<String> userBox;

  @override
  void initState() {
    userBox = Hive.box("favoriteBox2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
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
                  MyPasswordField(
                    textInputActionField: TextInputAction.next,
                    controller: _passwordController,
                    hintText: "Nova Senha",
                    icon: Icon(
                      Icons.key,
                      color: MyColors.primarydark,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: MyPasswordField(
                      textInputActionField: TextInputAction.done,
                      controller: _passwordConfirmationController,
                      hintText: "Confirme Sua Nova Senha",
                      icon: Icon(
                        Icons.key,
                        color: MyColors.primarydark,
                      ),
                    ),
                  ),
                  //  SizedBox(
                  //   height: 80,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 64.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MainButton(
                          labelText: "VOLTAR",
                          buttonPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          ),
                        ),
                        MainButton(
                          labelText: "CONFIRMAR",
                          buttonPressed: () async {
                            if ((_passwordController.text.isNotEmpty == true &&
                                    _passwordConfirmationController
                                            .text.isNotEmpty ==
                                        true) &&
                                _passwordController.text ==
                                    _passwordConfirmationController.text) {
                              return await updatePassword(
                                userBox.get("email")!,
                                _passwordController.text,
                                userBox.get("token")!,
                                context,
                              );
                            }
                            if (_passwordController.text.isNotEmpty != true) {
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
