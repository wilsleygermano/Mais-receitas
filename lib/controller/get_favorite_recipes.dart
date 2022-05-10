import 'package:cloud_firestore/cloud_firestore.dart';

Future getFavoriteRecipes(String userId) async {
  final dataBase = FirebaseFirestore.instance;
  final docRef = dataBase.collection(userId).doc();
  docRef.snapshots().listen(
        (event) => docRef.get(),
      );
}
