import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/data/user_model.dart';
import 'package:mais_receitas/screens/home_screen.dart';
import 'package:mais_receitas/widgets/page_viewer.dart';

Future getUserRegistered(
  String firstName,
  String lastName,
  String email,
  String password,
  BuildContext context,

) async {
  try {
    var hivebox = Hive.box<String>("favoriteBox2");
    var urlRegister = 'https://academy-auth.herokuapp.com/register';
    var urlLogin = "https://academy-auth.herokuapp.com/login";
    var responseRegister = await Dio().post(urlRegister, data: {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    });
    var responseLogin = await Dio().post(urlLogin, data: {
      'email': email,
      'password': password,
    });
    var user = UserModel.fromJson(responseRegister.data as Map<String, dynamic>);
    hivebox.putAll({
      "id": user.id!,
      "email": user.email!,
      "first_name": user.firstName!,
      "last_name": user.lastName!,
      "token": user.userToken!,
    });
    myDialog(
      context,
      "SUCESSO",
      "Usuário criado!",
      "OK",
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageViewer(),
        ),
      ),
    );
  } on DioError catch (e) {
    myDialog(
      context,
      "ERRO",
      "${e.response}",
      "OK",
      () => Navigator.pop(context),
    );
  }
}
