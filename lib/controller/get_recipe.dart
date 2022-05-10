import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mais_receitas/data/recipe_model.dart';

Future<RecipeModel?> getRecipe(String choosedRecipe) async {
  RecipeModel? recipe;
  try {
    final dio = Dio();
    var url =
        'https://afrodite-recipe.herokuapp.com/api/v0/recipes?recipe=$choosedRecipe';
    var response = await dio.get(url);
    final json = response.data;
    recipe = RecipeModel.fromJson(json as Map<String, dynamic>);
    return recipe;
  } on DioError catch (e) {
    debugPrint("${e.error}");
  }
  return recipe;
}

