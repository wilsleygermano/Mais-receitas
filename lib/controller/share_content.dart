
import 'package:mais_receitas/controller/get_recipe.dart';
import 'package:share_plus/share_plus.dart';

Future shareContent(String recipeName) async {
    var recipe = await getRecipe(recipeName);
    Share.share(
        "Receita: ${recipe!.recipes!.nome} \n"
        "Ingredientes: ${recipe.recipes!.ingredientes.toString()} \n"
        "Preparo: ${recipe.recipes!.preparo.toString()}",
        subject: recipe.recipes!.nome);
}