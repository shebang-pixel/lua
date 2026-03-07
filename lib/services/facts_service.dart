import 'dart:convert';

import '../models/facts_model.dart';
import 'package:http/http.dart' as http;

class FactsService {
  // fn to get data
  Future<FactsModel> fetchFact() async {
    final url = Uri.https('uselessfacts.jsph.pl', '/api/v2/facts/random');

    final response = await http.get(url);

    if(response.statusCode == 200) {
      // json -> dart obj
      final data = jsonDecode(response.body);
      // dart oj -> facts model
      return FactsModel.fromJson(data);
    } else {
      throw Exception('Failed to retrieve Fact!');
    }
  }
}
