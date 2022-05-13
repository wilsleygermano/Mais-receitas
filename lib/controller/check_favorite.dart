import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<bool> checkFavorite(String recipeName) async {
  final hive = Hive.box<String>("favoriteBox2");
  final userId = hive.get("id");
  final docRef = await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection("favorite_recipes")
      .doc(recipeName)
      .get()
      .then((value) => value.exists);
  
  return docRef;

}