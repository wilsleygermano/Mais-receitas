import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mais_receitas/classes/my_dialog.dart';
import 'package:mais_receitas/screens/signup_screen.dart';

Future loginUser(
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
    return [
      LoginModel.fromJson(response.data as Map<String, dynamic>),
      myDialog(
        context,
        "SUCESSO",
        "Seja bem-vindo(a)",
        "OK",
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignupScreen(), // MUDAR ISSO DEPOIS
          ),
        ),
      )
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

class LoginModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? userToken;

  LoginModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.userToken,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    userToken = json['token'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['token'] = userToken;
    return data;
  }
}
