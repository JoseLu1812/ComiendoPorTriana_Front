import 'dart:convert';

import 'package:comiendoportriana/config/locator.dart';
import 'package:comiendoportriana/models/login.dart';
import 'package:comiendoportriana/models/user.dart';
import 'package:comiendoportriana/models/user_register.dart';
import 'package:injectable/injectable.dart';

import 'package:comiendoportriana/rest/rest.dart';

@Order(-1)
@singleton
class UserRepository {
  late RestAuthenticatedClient _client;

  UserRepository() {
    _client = getIt<RestAuthenticatedClient>();
  }

  Future<dynamic> me() async {
    String url = "/me";
    var jsonResponse = await _client.get(url);
    return UserResponse.fromJson(jsonDecode(jsonResponse));
  }

  Future<User> createUser(UserRegister request) async {
    String url = '/auth/register';
    var response = await _client.post(url, request);
    return UserResponse.fromJson(jsonDecode(response));
  }
}
