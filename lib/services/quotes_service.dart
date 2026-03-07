import 'dart:convert';

import '../models/quotes_model.dart';
import 'package:http/http.dart' as http;

class QuotesService {
//   method to get quote
Future<QuotesModel> fetchQuote() async {
  final  url = Uri.https(
      'zenquotes.io',
      '/api/random',
  );

  final response = await http.get(url);

  if(response.statusCode == 200) {
    //   Json -> dart obj
    final data = jsonDecode(response.body);
    return QuotesModel.fromJson(data[0]);

  } else {
    throw Exception('Unable to get Quote');
  }
}
}