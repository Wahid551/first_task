import 'dart:convert';

import 'package:first_task/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Album> getPosts() async {
    var client = http.Client();
    // ignore: non_constant_identifier_names
    Album? NewsModel;
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await client.get(url);
      print(response.statusCode);
      // print(response.body);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString[0]);
        var jsonMap = jsonDecode(jsonString[0]);
        NewsModel = Album.fromJson(jsonMap);
      }
    } catch (exception) {
      throw exception;
    }
    return NewsModel!;
  }
}
