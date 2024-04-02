class GameModel {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final String genre;

  GameModel({required this.id, required this.title, required this.description, required this.thumbnail, required this.genre});

  factory GameModel.fromJson(Map<String, dynamic> json){
    return GameModel(id: json['id'], title: json['title'], description: json['short_description'], thumbnail: json['thumbnail'], genre: json['genre']);
  }
}