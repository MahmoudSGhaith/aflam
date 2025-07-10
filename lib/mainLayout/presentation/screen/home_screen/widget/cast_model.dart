class CastModel {
  final String? imagePath;
  final String? actressName;
  final String? characterName;

  CastModel({
    required this.imagePath,
    required this.actressName,
    required this.characterName,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      imagePath: json['url_small_image'] as String?,
      actressName: json['name'] as String?,
      characterName: json['character_name'] as String?,
    );
  }

  static List<CastModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CastModel.fromJson(json)).toList();
  }
}