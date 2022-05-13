import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mais_receitas/design/my_colors.dart';
import 'package:mais_receitas/screens/home_screen.dart';
import '../widgets/main_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  ListTile(
                    title: Text(
                      "Teste",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: MyColors.primarydark,
                        fontFamily: GoogleFonts.ptSerif().fontFamily,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                    ),
                    leading: Icon(
                      Icons.alternate_email,
                      color: MyColors.primarydark,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Teste",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: MyColors.primarydark,
                        fontFamily: GoogleFonts.ptSerif().fontFamily,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                    ),
                    leading: Icon(
                      Icons.alternate_email,
                      color: MyColors.primarydark,
                    ),
                  ),
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
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                      ),
                    ],
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
