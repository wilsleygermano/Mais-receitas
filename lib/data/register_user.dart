import 'dart:async';
import 'package:dio/dio.dart';

Future registerUser(
    String firstName, String lastName, String email, String password) async {
  var urlLogin = 'https://academy-auth.herokuapp.com/register';
  var response = await Dio().post(urlLogin, data: {
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'password': password,
  });
  if (response.statusCode == 201) {
    return UserModel.fromJson(response.data as Map<String, dynamic>);
  } else {
    return response.data;
  }
}

class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
