import 'package:flutter/material.dart';

class UserRegister {
  String? username;
  String? password;
  String? verifiedPassword;
  String? fullName;

  UserRegister(
      this.username, this.password, this.verifiedPassword, this.fullName);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['verifiedPassword'] = this.verifiedPassword;
    data['fullName'] = this.fullName;
    return data;
  }
}
