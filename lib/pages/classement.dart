import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Classement extends StatefulWidget {
  const Classement({super.key});

  @override
  State<Classement> createState() => _ClassementState();
}

class _ClassementState extends State<Classement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("classement"),
    );
  }
}