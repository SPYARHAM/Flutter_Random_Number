import 'package:flutter/material.dart';

class Text2 extends StatelessWidget {
  final VoidCallback generateRandomInt2;
  // ignore: non_constant_identifier_names
  Text2(this.generateRandomInt2, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(
            height: 5, //<-- SEE HERE
          ),
          const Text(
            "Click on the button below to generate number within Specific range:",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueAccent, fontSize: 17),
          ),
          const Text(
            "Here first 25 numbers are between 6 to 12, next 25 between 12 -3, next 25 between 3-6 and last 24 between 6-9:",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueAccent, fontSize: 17),
          ),
          ElevatedButton(
            onPressed: generateRandomInt2,
            child: const Text("Generate Number"),
          ),
        ],
      ),
    );
  }
}
