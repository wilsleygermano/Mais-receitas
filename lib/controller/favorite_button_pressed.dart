import 'package:cloud_firestore/cloud_firestore.dart';

Future favoriteButtonPressed(String docName, Map<String, dynamic> mapContent, String userId ) async {
  final dataBase = FirebaseFirestore.instance;
  return await dataBase
      .collection(userId)
      .doc(docName)
      .set(mapContent);
}
