import 'package:cloud_firestore/cloud_firestore.dart';

Future getFavoriteRecipes(String userId) async {
  final dataBase = FirebaseFirestore.instance;
  final docRef = dataBase.collection(userId);
  docRef.get().then(
        (res) => print("Successfully completed ${res.toString()}"),
        onError: (e) => print("Error completing: $e"),
      );
}
