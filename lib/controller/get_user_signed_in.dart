import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/data/user_model.dart';
import 'package:mais_receitas/screens/home_screen.dart';
import 'package:mais_receitas/widgets/page_viewer.dart';

Future getUserSignedIn(
  String email,
  String password,
  BuildContext context,
  Box<String> hiveBox,
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
    UserModel user = UserModel.fromJson(response.data);
    hiveBox.putAll({"id": user.id!, "email": user.email!});
    // function to retrieve hive box values
    // debugPrint(hiveBox.values.toString());
    myDialog(
      context,
      "SUCESSO!",
      "Seja bem-vindo(a).",
      "OK",
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageViewer(
            user: user,
          ),
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
