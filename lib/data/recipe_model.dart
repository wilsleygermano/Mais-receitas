// ignore_for_file: prefer_collection_literals

class RecipeModel {
  RecipesModel? recipes;

  RecipeModel({this.recipes});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    recipes =
        json['recipes'] != null ? RecipesModel.fromJson(json['recipes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (recipes != null) {
      data['recipes'] = recipes!.toJson();
    }
    return data;
  }
}

class RecipesModel {
  String? id;
  String? nome;
  List<String>? ingredientes;
  List<String>? preparo;
  List<String>? informacoes;

  RecipesModel(
      {this.id, this.nome, this.ingredientes, this.preparo, this.informacoes});

  RecipesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    ingredientes = json['ingredientes'].cast<String>();
    preparo = json['preparo'].cast<String>();
    informacoes = json['informacoes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['ingredientes'] = ingredientes;
    data['preparo'] = preparo;
    data['informacoes'] = informacoes;
    return data;
  }
}