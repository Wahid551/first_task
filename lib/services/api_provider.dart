import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class ApiServiceProvider extends ChangeNotifier {
  bool isData = false;
  Future<Album> getPosts() async {
    // ignore: non_constant_identifier_names
    Album? NewsModel;
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        NewsModel = Album.fromJson(jsonMap[0]);
        isData = true;
        notifyListeners();
      }
    } catch (exception) {
      isData = true;
      notifyListeners();
      throw exception;
    }
    return NewsModel!;
  }
}
