import 'dart:convert';

class JokesModel {
  String type;
  String setup;
  String punchline;
  int id;

  JokesModel({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  factory JokesModel.fromJson(Map<String, dynamic> json) => JokesModel(
    type: json["type"],
    setup: json["setup"],
    punchline: json["punchline"],
    id: json["id"],
  );


}