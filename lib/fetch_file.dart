import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:albums_route/schema_artists.dart';



Future<List<Artist>> fetchFileFromAssets(String assetsPath) async {
  final fileData = await rootBundle.loadString(assetsPath);
  final list = json.decode(fileData) as List<dynamic>;
  return list.map((e) => Artist.fromJson(e)).toList();
}
