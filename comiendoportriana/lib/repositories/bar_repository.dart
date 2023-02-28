import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/models/bar_response.dart';
import 'package:comiendoportriana/rest/rest.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';

import 'package:injectable/injectable.dart';

const String urlBase = '/bar';

@Order(-5)
@singleton
class BarRepository {
  late RestAuthenticatedClient _rest;

  BarRepository() {
    _rest = GetIt.I.get<RestAuthenticatedClient>();
  }

  Future<BarList> getListaBares(int page) async {
    String url = "$urlBase?page=$page";
    var response = await _rest.get(url);
    return BarList.fromJson(jsonDecode(response));
  }


  Future<BarResponse> getBarContent(String barId) async {
    String url = urlBase + barId;
    var response = await _rest.get(url);
    return BarResponse.fromJson(jsonDecode(response));
  }


}
