// ignore_for_file: prefer_collection_literals

class RecipesNameModel {
  List<String>? recipesName;

  RecipesNameModel({this.recipesName = const []});

  RecipesNameModel.fromJson(Map<String, dynamic> json) {
    recipesName = json['recipesName'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['recipesName'] = recipesName;
    return data;
  }
}