import 'dart:convert';

import '../models/jokes_model.dart';
import 'package:http/http.dart' as http;

class JokesService {
//   Fn to fetch data from API
  Future<JokesModel> fetchJoke() async {
  //   url
    final url = Uri.https(
      'official-joke-api.appspot.com',
      '/random_joke',
    );

  //   Send http request
    final response = await http.get(url);

  //   If successful
    if(response.statusCode == 200) {
      // json -> map
      final data = jsonDecode(response.body);

    //   map -> jokes Model
      print(JokesModel.fromJson(data));
      return JokesModel.fromJson(data);
    } else {
      throw Exception('Failed to get Data');
    }
  }
}