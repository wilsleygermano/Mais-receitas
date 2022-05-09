import 'package:mais_receitas/controller/get_recipes_repository.dart';
import 'package:mais_receitas/data/recipes_name_model.dart';

class HomeController {

  RecipesNameModel allRecipesName = RecipesNameModel(recipesName: []);
  final repository = GetRecipesRepository();
  HomeState state = HomeState.start;

  Future<void> start() async {
    state = HomeState.loading;
    allRecipesName = await repository.fetchAllRecipes();
    state = HomeState.success;
    state = HomeState.error;
  }
  
}

enum HomeState {start, loading, success, error}