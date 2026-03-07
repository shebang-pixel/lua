

class QuotesModel {
  String q;
  String a;
  String h;

  QuotesModel({
    required this.q,
    required this.a,
    required this.h,
  });

  factory QuotesModel.fromJson(Map<String, dynamic> json) =>
      QuotesModel(
        q: json["q"],
        a: json["a"],
        h: json["h"],
      );
}