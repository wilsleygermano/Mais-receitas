import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/controller/delete_firestore_docs.dart';
import 'package:mais_receitas/controller/delete_hive_user.dart';
import 'package:mais_receitas/controller/delete_user.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/home_screen.dart';
import 'package:mais_receitas/screens/login_screen.dart';
import 'package:mais_receitas/screens/update_password_screen.dart';
import 'package:mais_receitas/widgets/my_list_tile.dart';
import '../widgets/main_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Box<String> userData;

  @override
  void initState() {
    userData = Hive.box("favoriteBox2");
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  MyListTile(
                    tileText: userData.get("first_name")!.toTitleCase(),
                    tileIcon: Icon(
                      Icons.person_outline,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: MyListTile(
                      tileText: userData.get("last_name")!.toTitleCase(),
                      tileIcon: Icon(
                        Icons.person_outline,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: MyListTile(
                      tileText: userData.get("email")!,
                      tileIcon: Icon(Icons.mail_outline),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: InkWell(
                      splashColor: MyColors.primarydark,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdatePasswordScreen(),
                        ),
                      ),
                      child: MyListTile(
                        tileText: "Mudar Senha",
                        tileIcon: Icon(Icons.password_outlined),
                      ),
                    ),
                  ),

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
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                        ),
                        MainButton(
                          labelText: "EXCLUIR CONTA",
                          buttonPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(30, 30, 10, 10),
                                backgroundColor: MyColors.primarylight,
                                title: Text(
                                  "ATENÇÃO",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.secularOne().fontFamily,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primarydark),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  "Você realmente deseja excluir sua conta?",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.secularOne().fontFamily,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.primarydark),
                                  textAlign: TextAlign.center,
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          "NÃO",
                                          style: TextStyle(
                                              fontFamily:
                                                  GoogleFonts.secularOne()
                                                      .fontFamily,
                                              fontSize: 12,
                                              color: MyColors.primarydark),
                                        ),
                                      ),
                                      OutlinedButton(
                                        onPressed: () async {
                                          
                                            await deleteUser(
                                                userData.get("email")!,
                                                context);
                                            await deleteFirestoreDocs(context);
                                            await deleteHiveUser(context);
   
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "SIM",
                                          style: TextStyle(
                                              fontFamily:
                                                  GoogleFonts.secularOne()
                                                      .fontFamily,
                                              fontSize: 12,
                                              color: MyColors.primarydark),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
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
