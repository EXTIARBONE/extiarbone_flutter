import 'dart:convert';

class UserClassement {
  final String firstName;
  final String lastName;
  final int points;

  UserClassement({
    required this.firstName,
    required this.lastName,
    required this.points,
  });

  factory UserClassement.fromJson(Map<String, dynamic> json) => UserClassement(
        firstName: json["name"] as String,
        lastName: json["surname"] as String,
        points: json["score"] as int,
      );

  Map<String, dynamic> toJson() => {
        "name": firstName,
        "surname": lastName,
        "score": points,
      };
}
