import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mais_receitas/classes/my_dialog.dart';

Future deleteFirestoreDocs(BuildContext context) async {
  try {
    var userData = Hive.box<String>("favoriteBox2");
    final dataBase = FirebaseFirestore.instance;
    final userId = userData.get("id");
    await dataBase.collection("users").doc(userId).delete();
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