import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_extiarbonne/pages/add_action_bottom_sheet.dart';
import 'package:flutter_extiarbonne/widget/action_widget.dart';
import 'package:flutter_extiarbonne/widget/widget_action_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'form_action.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

Future<String?> _getPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? name = prefs.getString('name');
  return name;
}

Future<int?> _getPrefsScore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? score = prefs.getInt('score');
  return score;
}

class _EventState extends State<Event> {
  late String name = '';
  late int score = 0;
  List<ActionWidget> _actionsWidget = [];

  @override
  void initState() {
    super.initState();
    _setPrefs();
  }

  void _setPrefs() async {
    String? prefsName = await _getPrefs();
    int? prefsScore = await _getPrefsScore();
    setState(() {
      _fetchDataReward();
      name = prefsName ?? '';
      score = prefsScore ?? 0;
    });
  }

  void _fetchDataReward() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('https://extiarbone-back.azurewebsites.net/action'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse;
      List<ActionWidget> _actionsWidget = data
          .map((element) => ActionWidget(
              title: element['title'],
              points: element['amountToWin'],
              url: "test"))
          .toList();
      setState(() {
        this._actionsWidget = _actionsWidget;
      });
    } else {
      throw Exception('Erreur lors du chargements des actions');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Center(
            child: Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  "Bonjour $name",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Text(
                "Vous avez ",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$score points",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: const Color(0xFF5EB09C),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddActionPage()),
                  );
                  //_showBottomSheet(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF5EB09C),
                  ),
                ),
                child: Text(
                  "Ajouter une action",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 100,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Text(
                "Actions Quotidiennes :",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox()
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [ActionContainer(actionsWidget: _actionsWidget)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return AddAction();
    },
  );
}
 */