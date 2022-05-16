import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/classes/my_dialog.dart';

Future deleteHiveUser(BuildContext context) async {
  try {
    var userData = Hive.box<String>("favoriteBox2");
     await userData.deleteAll({
      "id",
      "email",
      "first_name",
      "last_name",
      "token",
    });
  } on Error catch (e) {
     myDialog(
      context,
      "ERRO",
      e.toString(),
      "OK",
      () => Navigator.pop(context),
    );
  }
}