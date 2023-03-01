import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ActionContainer extends StatelessWidget {
  const ActionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 150,
        color: Colors.blueGrey,
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Trajet jusqu au bureau'),
                  TextSpan(text: 'Rapporte 1,7 points'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Action"),
            )
          ],
        ));
  }
}
