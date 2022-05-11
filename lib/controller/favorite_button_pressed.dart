import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

Future favoriteButtonPressed(String docName, Map<String, dynamic> mapContent) async {
  final dataBase = FirebaseFirestore.instance;
  final hive = Hive.box<String>("favoriteBox2");

  final userId = hive.get("id");

  if(userId == null || userId.isEmpty) {
    throw Exception("deu ruim no hive");
  }

  return await dataBase
      .collection("users")
      .doc(userId)
      .collection("favorite_recipes")
      .doc(docName)
      .set(mapContent);
}
