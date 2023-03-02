import 'package:flutter/material.dart';

class Classement extends StatefulWidget {
  const Classement({Key? key}) : super(key: key);

  @override
  State<Classement> createState() => _ClassementState();
}

class _ClassementState extends State<Classement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          const Text(
            "Classement",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 10,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "12 points",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Se termine le 31/03/2023",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          TabBar(
            controller: _tabController,
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
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                // Contenu du premier onglet
                Center(
                  child: Text('Contenu de la liste'),
                ),
                // Contenu du deuxième onglet
                Center(
                  child: Text('Contenu de la liste'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
