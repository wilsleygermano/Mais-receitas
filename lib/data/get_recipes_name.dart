import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future getRecipesNames() async {
  try {
    final dio = Dio();
    const url =
        "https://afrodite-recipe.herokuapp.com/api/v0/recipes/names";
    var response = await dio.get(url);
    return RecipesNameModel.fromJson(response.data as Map<String, dynamic>);
  } on DioError catch (e) {
    debugPrint('${e.error}');
  }
}

class RecipesNameModel {
  String? recipesName;

  RecipesNameModel({this.recipesName});

  RecipesNameModel.fromJson(Map<String, dynamic> json) {
    recipesName = json['recipesName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['recipesName'] = recipesName;
    return data;
  }
}
