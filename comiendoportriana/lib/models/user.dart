/*class User {
  final String name;
  final String email;
  final String accessToken;
  final String? avatar;

  User({required this.name, required this.email, required this.accessToken, this.avatar});

  @override
  String toString() => 'User { name: $name, email: $email}';
}*/

import 'package:comiendoportriana/models/login.dart';

class User {
  String? id;
  String? username;
  String? fullName;
  String? email;

  User({this.id, this.username, this.fullName, this.email});

  User.fromLoginResponse(LoginResponse response) {
    this.id = response.id;
    this.username = response.username;
    this.fullName = response.fullName;
    this.email = response.email;
  }
}

class UserResponse extends User {
  UserResponse(id, username, fullName, email)
      : super(id: id, username: username, fullName: fullName, email: email);

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['fullName'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    return data;
  }
}
