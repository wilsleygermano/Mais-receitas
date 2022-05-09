import 'package:cloud_firestore/cloud_firestore.dart';

Future favoriteButtonPressed(String docName, Map<String, dynamic> mapContent ) async {
  final dataBase = FirebaseFirestore.instance;
  return await dataBase
      .collection("favorite_recipes")
      .doc(docName)
      .set(mapContent);
}
