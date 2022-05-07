import 'package:mais_receitas/data/get_recipes_name.dart';
import 'package:mais_receitas/data/get_recipes_repository.dart';

class HomeController {

  RecipesName allRecipesName = RecipesName(recipesName: []);
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