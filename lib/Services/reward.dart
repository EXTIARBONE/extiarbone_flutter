import 'dart:convert';

class Reward {
  final String id;
  final String gift;

  Reward({required this.id, required this.gift});

  factory Reward.fromJson(Map<String, dynamic> json) => Reward(
        id: json["_id"],
        gift: json["gift"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gift": gift,
      };
}
