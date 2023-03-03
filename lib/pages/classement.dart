import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_extiarbonne/Services/reward.dart';
import 'package:flutter_extiarbonne/Services/userClassement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Classement extends StatefulWidget {
  const Classement({Key? key}) : super(key: key);

  @override
  State<Classement> createState() => _ClassementState();
}

class _ClassementState extends State<Classement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool _isLoading = true;
  late String role = "";
  late String name = "";
  late bool isAdmin = false;

  Future<String?> _getPrefsName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    return name;
  }

  Future<String?> _getPrefsRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString('role');
    print("MON ROLE: $role");
    if (role == "ADMIN") {
      setState(() {
        isAdmin = true;
      });
    } else {
      setState(() {
        isAdmin = false;
      });
    }
    return role;
  }

  void _setPrefs() async {
    String? prefsName = await _getPrefsName();
    String? prefsRole = await _getPrefsRole();
    setState(() {
      name = prefsName ?? '';
      role = prefsRole ?? '';
    });
  }

  String _points = '0';
  late DateTime now;
  late DateTime endOfMonth;
  String _date = '';
  List<Reward> _rewards = [];
  List<UserClassement> userClassements = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _fetchDataUserClassement();
    _setPrefs();
    _tabController = TabController(length: 2, vsync: this);
    now = DateTime.now();
    endOfMonth = DateTime(now.year, now.month + 1, 0);
    _date =
        '${endOfMonth.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}';
  }

  Future<void> _loadData() async {
    _fetchDataReward();
    setState(() {
      _isLoading = false;
    });
  }

  void _fetchData() async {
    final response =
        await http.get(Uri.parse('https://api.example.com/classement'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _points = data['points'];
        _date = data['date'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _fetchDataUserClassement() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('https://extiarbone-back.azurewebsites.net/ranking/'),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse;
      List<UserClassement> userClassements = data
          .map((element) => UserClassement(
                firstName: element['name'],
                lastName: element['surname'],
                points: element['score'],
              ))
          .toList();
      userClassements.sort((a, b) => b.points.compareTo(a.points));
      setState(() {
        this.userClassements = userClassements;
      });
    } else {
      throw Exception('Erreur lors du chargement des classements');
    }
  }

  void _fetchDataReward() async {
    final response = await http.get(Uri.parse(
        'https://extiarbone-back.azurewebsites.net/reward/getAllRewardsAvailable'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse["rewards"];
      List<Reward> _rewards = data
          .map((element) => Reward(
                id: element['_id'],
                gift: element["gift"],
              ))
          .toList();
      setState(() {
        this._rewards = _rewards;
      });
    } else {
      throw Exception('Erreur lors du chargements des lots');
    }
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? buildShimmerList() : buildRewardList(),
    );
  } */

  Widget buildRewardList() {
    return ListView.builder(
      itemCount: _rewards.length,
      itemBuilder: (context, index) {
        Reward reward = _rewards[index];
        var medalColor = Colors.grey;
        var medalIcon;
        switch (index) {
          case 0:
            medalColor = Colors.amber;
            medalIcon = Icons.looks_one;
            break;
          case 1:
            medalColor = Colors.grey;
            medalIcon = Icons.looks_two;
            break;
          case 2:
            medalColor = Colors.brown;
            medalIcon = Icons.looks_3;
            break;
          default:
            medalColor = Colors.grey;
            medalIcon = Icons.circle;
        }

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: medalColor,
                  ),
                  child: Icon(
                    medalIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reward.gift,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Classement",
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  if (isAdmin) // Vérifier si isAdmin est vrai
                    const Text(
                      "En tant qu'administrateur, vous n'avez pas de points",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  if (isAdmin) // Vérifier si isAdmin est faux et _points est supérieur à zéro
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Vous cumulez ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '$_points points', // Le texte dynamique
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5EB09C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isAdmin &&
                      _points ==0) // Vérifier si isAdmin est faux et _points est égal à zéro
                    const Text(
                      "Vous n'avez pas encore de points",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    "Se termine le $_date",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF5EB09C),
            tabs: const [
              Tab(
                child: Text(
                  'Employés',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  'Lots',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    _fetchDataUserClassement();
                  },
                  child: ListView.builder(
                    itemCount: userClassements.length,
                    itemBuilder: (context, index) {
                      final user = userClassements[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(children: [
                                  Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${user.firstName} ${user.lastName}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${user.points}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5EB09C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    _fetchDataReward();
                  },
                  child: ListView.builder(
                    itemCount: _rewards.length,
                    itemBuilder: (context, index) {
                      Reward reward = _rewards[index];
                      var medalColor = Colors.grey;
                      var medalIcon;
                      switch (index) {
                        case 0:
                          medalColor = Colors.amber;
                          medalIcon = Icons.looks_one;
                          break;
                        case 1:
                          medalColor = Colors.grey;
                          medalIcon = Icons.looks_two;
                          break;
                        case 2:
                          medalColor = Colors.brown;
                          medalIcon = Icons.looks_3;
                          break;
                        default:
                          medalColor = Colors.grey;
                          medalIcon = Icons.circle;
                      }

                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: medalColor,
                                ),
                                child: Icon(
                                  medalIcon,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      reward.gift,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
