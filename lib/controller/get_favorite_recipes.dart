import 'package:cloud_firestore/cloud_firestore.dart';

Future getFavoriteRecipes(String userId) async {
  final dataBase = FirebaseFirestore.instance;
  final docRef = dataBase.collection("users").doc(userId).collection("favorite_recipes").doc();
  docRef.get().then(
        (res) => print("Successfully completed"),
        onError: (e) => print("Error completing: $e"),
      );
}

// TODO: try to retrieve firebase documents and build a list