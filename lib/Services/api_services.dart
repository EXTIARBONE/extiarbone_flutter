import 'dart:convert';
import 'package:flutter_extiarbonne/Services/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginException implements Exception {
  final String message;

  LoginException(this.message);

  @override
  String toString() {
    return 'Erreur de connexion : $message';
  }
}

class ApiServices {
  static const _urlApi = "https://extiarbone-back.azurewebsites.net";

  static Future<void> fetchDataLogin(String email, String password) async {
    final response = await http.post(Uri.parse('$_urlApi/auth/login'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body:
            jsonEncode(<String, String>{'mail': email, 'password': password}));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final token = jsonResponse['token'];
      final name = jsonResponse['name'];
      final surname = jsonResponse['surname'];
      final mail = jsonResponse['mail'];
      final userId = jsonResponse['userId'];
      final score = jsonResponse['score'].toString();
      final role = jsonResponse['role'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('name', name);
      prefs.setString('surname', surname);
      prefs.setString('mail', mail);
      prefs.setString('userId', userId);
      prefs.setString('score', score);
      prefs.setString('role', role);
    } else {
      String message = 'Une erreur s\'est produite lors de la connexion.';
      if (response.statusCode == 400) {
        message = 'Informations de connexion incorrectes.';
      } else if (response.statusCode == 404 || response.statusCode == 500) {
        message = 'Serveur indisponible. Veuillez réessayer plus tard.';
      }
      throw LoginException(message);
    }
  }

  static Future<void> signUp(name, surname, mail, password) async {
    final http.Response response = await http.post(
      (Uri.parse('$_urlApi/auth/subscribe')),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'surname': surname,
        'mail': mail,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      print("Compte cree");
    } else {
      throw Exception('Erreur de connexion');
    }
  }

  static Future<List<User>> getiosUsers() async {
    final response = await http.get(
      Uri.parse("https://democracity-api.herokuapp.com/androidusers"),
    );
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<User> users =
        (jsonBody as List).map((user) => User.fromJson(user)).toList();

    return users;
  }

  static Future<List<User>> getFavorites() async {
    final response = await http.get(
      Uri.parse("https://democracity-api.herokuapp.com/favorites"),
    );
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<User> users =
          (jsonBody as List).map((user) => User.fromJson(user)).toList();
      return users;
    } else {
      throw Error();
    }
  }

  static Future<List> getUserCount() async {
    final response = await http.get(
      Uri.parse("https://democracity-api.herokuapp.com/count"),
    );
    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List userCount = (jsonBody as List);
    return userCount;
  }

  static Future<bool> addFavorite(String username) async {
    final http.Response response = await http.put(
      (Uri.parse('https://democracity-api.herokuapp.com/favorite/$username')),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    var data = response.body;
    print(data);

    return response.statusCode == 200;
  }
}
