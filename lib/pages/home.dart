import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_extiarbonne/Services/reward.dart';
import 'package:flutter_extiarbonne/Services/userClassement.dart';
import 'package:flutter_extiarbonne/pages/actions.dart';
import 'package:flutter_extiarbonne/pages/profil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'classement.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String role = "";
  late String name = "";
  late bool isAdmin = false;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Event(),
    Classement(),
    Profil()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void initState() {
    super.initState();
    _setPrefs();
  }

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

  @override
  Widget build(BuildContext context) {
    final List<Widget> _filteredOptions =
        isAdmin ? _widgetOptions.sublist(1) : _widgetOptions;

    return Scaffold(
      body: Center(
        child: _filteredOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: isAdmin
            ? <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.view_list_rounded),
                  label: 'Classement',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ]
            : <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Actions',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.view_list_rounded),
                  label: 'Classement',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF5EB09C),
        onTap: _onItemTapped,
      ),
    );
  }
}
