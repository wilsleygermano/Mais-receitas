import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mais_receitas/data/favorite_model.dart';


  Stream<List<FavoritesModel>> getFavoriteRecipes(List<FavoritesModel> favList, String? userId) async* {
    favList = [];
    if (userId != null) {
      final docs = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection("favorite_recipes")
          .get();

      favList =
          docs.docs.map((e) => FavoritesModel.fromJson(e.data())).toList();

      yield favList;
    }
  }