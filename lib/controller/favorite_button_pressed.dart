import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Future favoriteButtonPressed(String docName, Map<String, dynamic> mapContent,
    BuildContext myContext) async {
  final dataBase = FirebaseFirestore.instance;
  final hive = Hive.box<String>("favoriteBox2");
  final userId = hive.get("id");

  await FirebaseFirestore.instance.collection("users").doc(userId).set({"id": userId});

  final docRef = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection("favorite_recipes")
      .doc(docName)
      .get()
      .then((value) => !value.exists);

  if (userId == null || userId.isEmpty) {
    throw Exception("deu ruim no hive");
  } else if (docRef == false) {
    return await dataBase
        .collection("users")
        .doc(userId)
        .collection("favorite_recipes")
        .doc(docName)
        .delete();
  }
  return await dataBase
      .collection("users")
      .doc(userId)
      .collection("favorite_recipes")
      .doc(docName)
      .set(mapContent);
}
