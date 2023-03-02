import 'dart:convert';

class Reward {
  final int id;
  final String title;
  final String description;
  final int points;

  Reward({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
  });

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        id: json["id"] as int,
        title: json["title"] as String,
        description: json["description"] as String,
        points: json["points"] as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "points": points,
      };
}
