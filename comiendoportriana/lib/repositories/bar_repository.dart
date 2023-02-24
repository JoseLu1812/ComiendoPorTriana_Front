import 'package:comiendoportriana/models/bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:injectable/injectable.dart';

const _postLimit = 20;

@Order(-1)
@singleton
class BarRepository {

  final httpClient = http.Client();

  Future<List<BarContent>> fetchPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;

      return List<BarContent>.from(
        body.map((p) => BarContent.fromJson(p))
      );
      
    }
    throw Exception('error fetching posts');
  }



}