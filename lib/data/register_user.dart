import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/screens/login_screen.dart';

Future registerUser(
  String firstName,
  String lastName,
  String email,
  String password,
  BuildContext context,
) async {
  try {
    var urlLogin = 'https://academy-auth.herokuapp.com/register';
    var response = await Dio().post(urlLogin, data: {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    });
    return [
      UserModel.fromJson(response.data as Map<String, dynamic>),
      myDialog(
        context,
        "SUCESSO",
        "Usuário criado!",
        "OK",
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        ),
      )
    ];
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

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
