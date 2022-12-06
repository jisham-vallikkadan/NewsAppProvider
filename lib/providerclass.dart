import 'dart:convert';

import 'package:apifirstdemo/articlesmodelcalss.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewProvider with ChangeNotifier {
  var _data = "";
  get data => _data;


  Future<List<Newscad>> getnews(String country, String category) async {
    final url = country == '' || category == ""
        ? "https://newsapi.org/v2/everything?q=all&apiKey=50b2fc7e78a245b98701442b0309368c"
        : "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=90989a3f589c4b9e8f6da9e09aac232d";
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      var body = jsonDecode(responce.body);
      List<Newscad> listdata =
          List<Newscad>.from(body['articles'].map((e) => Newscad.fromJson(e)))
              .toList();
      return listdata;
    } else {
      List<Newscad> listdata = [];
      return listdata;
    }
  }
}
