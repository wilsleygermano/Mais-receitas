import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/screens/login_screen.dart';

import '../classes/my_dialog.dart';

Future deleteUser(String userEmail, BuildContext context) async {
  try {
    var userData = Hive.box<String>("favoriteBox2");

    var urlDeleteUser = "https://academy-auth.herokuapp.com/delete-user";
    await Dio().post(urlDeleteUser,
        data: {
          "email": userEmail,
        },
        options: Options(
          headers: {
            'x-access-token': userData.get("token"),
          },
        ));
    userData.deleteAll({
      "id",
      "email",
      "first_name",
      "last_name",
      "token",
    });
    
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
