import 'package:flutter/material.dart';
import 'dart:math';

import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  final Position position;

  Location({required this.position});
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _selectedLocation = '';
  int? _generatedNumber;

  void _generateNumberWithLocation() {
    if (_selectedLocation.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please select at least one location.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }
    while (true) {
      _generatedNumber = Random().nextInt(100) + 1;
      if (_selectedLocation == 'India' && _isEven(_generatedNumber!)) {
        break;
      }
      if (_selectedLocation == 'USA' && _isOdd(_generatedNumber!)) {
        break;
      }
      if (_selectedLocation == 'Russia' && _isPrime(_generatedNumber!)) {
        break;
      }
    }
    setState(() {});
  }

  bool _isEven(int number) {
    return number % 2 == 0;
  }

  bool _isOdd(int number) {
    return number % 2 == 1;
  }

  bool _isPrime(int number) {
    if (number < 2) {
      return false;
    }
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Choose a Location",
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),

              const Text(
                "India for Even , USA for odd and Russia for Prime Numbers",
                style: TextStyle(color: Colors.redAccent),
                // style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'India',
                    groupValue: _selectedLocation,
                    onChanged: (value) {
                      setState(() {
                        _selectedLocation = value!;
                      });
                    },
                  ),
                  const Text('India'),
                  const SizedBox(width: 15),
                  Radio(
                    value: 'USA',
                    groupValue: _selectedLocation,
                    onChanged: (value) {
                      setState(() {
                        _selectedLocation = value!;
                      });
                    },
                  ),
                  const Text('USA'),
                  const SizedBox(width: 15),
                  Radio(
                    value: 'Russia',
                    groupValue: _selectedLocation,
                    onChanged: (value) {
                      setState(() {
                        _selectedLocation = value!;
                      });
                    },
                  ),
                  const Text('Russia'),
                ],
              ),
              // SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateNumberWithLocation,
                child: const Text('Generate Number Using Location'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _generatedNumber == null
            ? Container()
            : Text(
                'Generated Number: $_generatedNumber',
                style: const TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
      ],
    );
  }
}
