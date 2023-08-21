import 'package:flutter/material.dart';

class FirstButton extends StatelessWidget {
  final VoidCallback selectHandler;
  // ignore: non_constant_identifier_names
  FirstButton(this.selectHandler);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Text(
            "Click on the button below to generate the random number:",
            style: TextStyle(fontSize: 16, color: Colors.redAccent),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: selectHandler,
            child: const Text("Generate Number"),
          ),
        ],
      ),
    );
  }
}
