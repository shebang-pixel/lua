class FactsModel {
    String id;
    String text;
    String source;
    String sourceUrl;
    String language;
    String permalink;

    FactsModel({
        required this.id,
        required this.text,
        required this.source,
        required this.sourceUrl,
        required this.language,
        required this.permalink,
    });

    factory FactsModel.fromJson(Map<String, dynamic> json) => FactsModel(
        id: json["id"],
        text: json["text"],
        source: json["source"],
        sourceUrl: json["source_url"],
        language: json["language"],
        permalink: json["permalink"],
    );
}