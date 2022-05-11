class FavoriteModel {
  FavoritesModel? recipes;

  FavoriteModel({this.recipes});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    recipes =
        json['recipes'] != null ? FavoritesModel.fromJson(json['recipes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (recipes != null) {
      data['recipes'] = recipes!.toJson();
    }
    return data;
  }
}

class FavoritesModel {
  String? nome;

  FavoritesModel(
      {this.nome,});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nome'] = nome;
    return data;
  }
}