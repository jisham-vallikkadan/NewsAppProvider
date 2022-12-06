// import 'dart:convert';
// import 'package:apifirstdemo/articlesmodelcalss.dart';
// import 'package:http/http.dart' as http;
//
// class NewsApi {
//   Future<List<Newscad>> getNews(String country, String category) async {
//     final url =
//         "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=90989a3f589c4b9e8f6da9e09aac232d";
//
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       var body = json.decode(response.body);
//
//       List<Newscad> listData =
//           List<Newscad>.from(body['articles'].map((v) => Newscad.fromJson(v)))
//               .toList();
//
//       return listData;
//     } else {
//       List<Newscad> listData = [];
//       return listData;
//     }
//   }
// }
