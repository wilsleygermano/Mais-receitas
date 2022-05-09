import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/data/user_model.dart';
import 'package:mais_receitas/screens/home_page.dart';

Future getUserSignedIn(
  String email,
  String password,
  BuildContext context,
) async {
  try {
    var urlLogin = "https://academy-auth.herokuapp.com/login";
    var response = await Dio().post(
      urlLogin,
      data: {
        'email': email,
        'password': password,
      },
    );
    UserModel user;
    user = UserModel.fromJson(response.data as Map<String, dynamic>);
    return [
      user,
      myDialog(
        context,
        "SUCESSO",
        "Seja bem-vindo(a)",
        "OK",
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        ),
      ),
    ];
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
