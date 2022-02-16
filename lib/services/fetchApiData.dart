// import 'dart:convert';

// import 'package:first_task/model/model.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   Future<Album> getPosts() async {
//     // var client = http.Client();
//     // ignore: non_constant_identifier_names
//     Album? NewsModel;
//     try {
//       // var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//       // var response = await client.get(url);
//       final response = await http
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//       print(response.statusCode);
//       // print(response.body);

//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         var jsonMap = jsonDecode(jsonString);
//         NewsModel = Album.fromJson(jsonMap[0]);
//       }
//     } catch (exception) {
//       throw exception;
//     }
//     return NewsModel!;
//   }
// }
