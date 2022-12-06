import 'package:flutter/material.dart';
import 'package:apifirstdemo/sourcemodelclass.dart';

class Source {
  String name;

  Source({ required this.name});
  factory Source.fromJson(Map<String, dynamic> response) {
    return Source(name: response['name']);
  }
}
