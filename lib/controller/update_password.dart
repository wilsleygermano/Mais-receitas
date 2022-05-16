import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mais_receitas/screens/home_screen.dart';

import '../classes/my_dialog.dart';

Future updatePassword(
  String userEmail,
  String userNewPassword,
  String userToken,
  BuildContext context,

) async {
  try {
    var urlUpdate = "https://academy-auth.herokuapp.com/update";
    await Dio().patch(urlUpdate, data: {
      "email": userEmail,
      "new_password": userNewPassword,
    },
    options: Options(headers: {
      'x-access-token': userToken,
    },),);

    myDialog(
      context,
      "SUCESSO!",
      "Sua senha foi alterada.",
      "OK",
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      ),
    );
  } on DioError catch (e) {
    myDialog(
      context,
      "ERRO:",
      "${e.response}",
      "OK",
      () => Navigator.pop(context),
    );
  }

}
