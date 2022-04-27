import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final client = HttpClient();

String catInfoText = '';
String catDataCreate = '';
List catInfoList = [];

Future getRequest() async {
  final url = Uri.parse('https://cat-fact.herokuapp.com/facts/random');
  final request = await client.getUrl(url);
  final response = await request.close();
  final jsonString = await response.transform(utf8.decoder).toList();
  final requestInfo = jsonString.join();
  final jsonRequest = jsonDecode(requestInfo) as Map;
  catDataCreate =
      '${jsonRequest['createdAt']}'.substring(0, 16).replaceAll('T', ' / ');
  catInfoText = '${jsonRequest['text']} | $catDataCreate';
  return [catInfoText, catDataCreate];
}

Future<bool> evictImage(String imageURL) async {
  final NetworkImage provider = NetworkImage(imageURL);
  return await provider.evict();
}

Future addCatInfo() async {
  catInfoList.clear();
  var box = await Hive.openBox<dynamic>('catData');
  final catInfo = await box.add(catInfoText);
  catInfoList.addAll(box.values);
  await box.close();
}

Future getListCount() async {
  catInfoList.clear();
  var box = await Hive.openBox<dynamic>('catData');
  catInfoList.addAll(box.values);
  return catInfoList.length;
}
