import 'package:dio/dio.dart';
import 'package:mais_receitas/data/recipes_name_model.dart';

class GetRecipesRepository {
  final dio = Dio();
  final url = "https://afrodite-recipe.herokuapp.com/api/v1/recipes/names";

  Future<RecipesNameModel> fetchAllRecipes() async {
    final response = await dio.get(url);
    final json = response.data;
    final allRecipes = RecipesNameModel.fromJson(json);

    return allRecipes;
  }

  
}