import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<Recipe?> getRecipe(String choosedRecipe) async {
  Recipe? recipe;
  try {
    final dio = Dio();
    var url =
        'https://afrodite-recipe.herokuapp.com/api/v0/recipes?recipe=${choosedRecipe}';
    var response = await dio.get(url);
    final json = response.data;
    recipe = Recipe.fromJson(json as Map<String, dynamic>);
    return recipe;
  } on DioError catch (e) {
    debugPrint("${e.error}");
  }
  return recipe;
}

class Recipe {
  Recipes? recipes;

  Recipe({this.recipes});

  Recipe.fromJson(Map<String, dynamic> json) {
    recipes =
        json['recipes'] != null ? Recipes.fromJson(json['recipes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (recipes != null) {
      data['recipes'] = recipes!.toJson();
    }
    return data;
  }
}

class Recipes {
  Id? iId;
  String? nome;
  List<Secao>? secao;

  Recipes({this.iId, this.nome, this.secao});

  Recipes.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    nome = json['nome'];
    if (json['secao'] != null) {
      secao = <Secao>[];
      json['secao'].forEach((v) {
        secao!.add(Secao.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['nome'] = nome;
    if (secao != null) {
      data['secao'] = secao!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['$oid'] = oid;
    return data;
  }
}

class Secao {
  String? nome;
  List<String>? conteudo;

  Secao({this.nome, this.conteudo});

  Secao.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    conteudo = json['conteudo'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = nome;
    data['conteudo'] = conteudo;
    return data;
  }
}




