import 'dart:convert';
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
  static Map mapTransport = {
    "Voiture diesel": 'dieselCar',
    "Voiture hybride": 'hybridCar',
    "Van diesel": 'vanDiesel',
    "Voiture au pétrole": 'petrolCar',
    "Taxi": 'Taxi',
    "Bus": 'Bus',
    "Métro": 'Metro',
  };

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
      final score = jsonResponse['score'];
      final role = jsonResponse['role'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setString('name', name);
      prefs.setString('surname', surname);
      prefs.setString('mail', mail);
      prefs.setString('userId', userId);
      prefs.setInt('score', score);
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

  static fetchD() async {
    final response = await http.get(Uri.parse(
      '$_urlApi/reward/getAllRewardsAvailable',
    ));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse["rewards"];
    } else {
      throw Exception('Erreur lors du chargements des lots');
    }
  }

  static Future<String> addAction(num distance, String vehicule) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.post(Uri.parse('$_urlApi/carbonScore/'),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          "distance": distance,
          "vehicle": mapTransport[vehicule]
        }));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse["score"]["carbon"];
    } else {
      throw Exception('Erreur lors de la création de l\'action');
    }
  }

  static updatePointsUser(num points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');
    int? score = prefs.getInt('score');
    points += score as num;
    final response = await http.put(Uri.parse('$_urlApi/user/$userId'),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, num>{"score": points}));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse;
    } else {
      throw Exception('Erreur lors de la création de l\'action');
    }
  }
}
