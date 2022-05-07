import 'package:dio/dio.dart';
import 'package:mais_receitas/data/get_recipes_name.dart';

class GetRecipesRepository {
  final dio = Dio();
  final url = "https://afrodite-recipe.herokuapp.com/api/v0/recipes/names";

  Future<RecipesName> fetchAllRecipes() async {
    final response = await dio.get(url);
    final json = response.data;
    final allRecipes = RecipesName.fromJson(json);

    return allRecipes;
  }

  
}