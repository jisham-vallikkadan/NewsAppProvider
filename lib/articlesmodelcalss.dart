import 'package:apifirstdemo/sourcemodelclass.dart';

class Newscad {
  String? urlToImage;
  String? title;
  String? description;
  Source? source;
  Newscad({
    this.urlToImage,
    this.title,
    this.description,
    this.source,
  });

  factory Newscad.fromJson(Map<String, dynamic> response) {
    return Newscad(
      urlToImage: response['urlToImage'],
      title: response['title'],
      description: response['description'],
      source: Source.fromJson(response['source']),
    );
  }
}
