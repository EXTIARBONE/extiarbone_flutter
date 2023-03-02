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
        firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,
        points: json["points"] as int,
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "points": points,
      };
}
