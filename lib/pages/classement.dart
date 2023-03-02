import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_extiarbonne/Services/reward.dart';
import 'package:flutter_extiarbonne/Services/userClassement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Classement extends StatefulWidget {
  const Classement({Key? key}) : super(key: key);

  @override
  State<Classement> createState() => _ClassementState();
}

class _ClassementState extends State<Classement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String _points = '0';
  String _date = '12/03/2023';
  List<Reward> rewards = [
    Reward(id: 1, title: "Test", description: "Description", points: 12),
    Reward(id: 2, title: "Voyage", description: "Description", points: 200),
    Reward(id: 3, title: "Mcdo", description: "Description", points: 300),
    Reward(id: 4, title: "Mcdo", description: "Description", points: 300)
  ];
  List<UserClassement> userClassements = [
    UserClassement(firstName: "Noé", lastName: "Noé", points: 1269),
    UserClassement(firstName: "Manu", lastName: "Manu", points: 48),
    UserClassement(firstName: "Nicolas", lastName: "Lacoste", points: 24),
    UserClassement(firstName: "Théo", lastName: "Gamiz", points: 12),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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

  Future<void> _fetchDataUserClassement() async {
    final response =
        await http.get(Uri.parse('https://monapi.com/userclassement'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];
      List<UserClassement> userClassements = data
          .map((element) => UserClassement(
                firstName: element['firstName'],
                lastName: element['lastName'],
                points: element['points'],
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

  Future<void> _fetchDataReward() async {
    final response = await http.get(Uri.parse('https://monapi.com/data'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse['data'];
      List<Reward> rewards = data
          .map((element) => Reward(
                id: element['id'],
                title: element['title'],
                description: element['description'],
                points: element['points'],
              ))
          .toList();
      setState(() {
        this.rewards = rewards;
      });
    } else {
      throw Exception('Erreur lors du chargements des lots');
    }
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
                            color: Colors.green,
                          ),
                        ),
                      ],
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
            indicatorColor: Colors.green,
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
                    _fetchDataReward;
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
                          padding: EdgeInsets.all(10),
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
                                  color: Colors.green,
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
                    _fetchDataReward;
                  },
                  child: ListView.builder(
                    itemCount: rewards.length,
                    itemBuilder: (context, index) {
                      Reward reward = rewards[index];
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
                                      reward.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      reward.description,
                                      style: const TextStyle(fontSize: 16),
                                    ),
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
