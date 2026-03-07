import 'dart:convert';

import '../models/pictures_model.dart';
import 'package:http/http.dart' as http;

class PicturesService {
  Future<PictureModel> fetchPicture() async {
    final url = Uri.https(
      'dog.ceo',
      '/api/breeds/image/random'
    );

    final response = await http.get(url);
    // on success
    if(response.statusCode == 200) {
      // json -> dart obj
      final data = jsonDecode(response.body);
      // dort obj -> picture model
      return PictureModel.fromJson(data);
    } else {
      throw Exception('Failed to fetch Picture URL');
    }
  }
}