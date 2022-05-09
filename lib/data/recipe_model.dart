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
  Id? iId;
  String? nome;
  List<Secao>? secao;

  RecipesModel({this.iId, this.nome, this.secao});

  RecipesModel.fromJson(Map<String, dynamic> json) {
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




