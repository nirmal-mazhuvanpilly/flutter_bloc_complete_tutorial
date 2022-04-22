import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_complete_tutorial/model/jokes_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseServices {
  Future<JokesModel?> getJokesData();
}

class ApiServices implements BaseServices {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  @override
  Future<JokesModel?> getJokesData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        return JokesModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load joke");
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
