class PictureModel {
    String message;
    String status;

    PictureModel({
        required this.message,
        required this.status,
    });

    factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
        message: json["message"],
        status: json["status"],
    );
}