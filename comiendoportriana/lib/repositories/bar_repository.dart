
import 'package:comiendoportriana/models/bar.dart';
import 'package:comiendoportriana/rest/rest.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';

const _postLimit = 20;
const String urlBase = '/bar/';

@Order(-1)
@singleton
class BarRepository {
  late RestClient _rest;

  BarRepository() {
    _rest = GetIt.I.get<RestClient>();
  }

  Future<Bar> fetchBares([int startIndex = 0]) async {
    String url = urlBase;
    final response = await _rest.get(url);
    return Bar.fromJson(jsonDecode(response));
  }



}
