// ignore_for_file: prefer_collection_literals

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? userToken;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.userToken,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    userToken = json['token'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['token'] = userToken;
    return data;
  }
}
