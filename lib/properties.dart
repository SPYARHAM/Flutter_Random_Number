import 'package:flutter/material.dart';
import 'dart:math';

class Properties extends StatefulWidget {
  const Properties({super.key});

  @override
  State<Properties> createState() => _PropertiesState();
}

class _PropertiesState extends State<Properties> {
  String _selectedProperty = '';
  int? _generatedNumber;

  void _generateNumberWithProperty() {
    if (_selectedProperty.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please select at least one Property.'),
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
      if (_selectedProperty == 'Even' && _isEven(_generatedNumber!)) {
        break;
      }
      if (_selectedProperty == 'Odd' && _isOdd(_generatedNumber!)) {
        break;
      }
      if (_selectedProperty == 'Prime' && _isPrime(_generatedNumber!)) {
        break;
      }
      if (_selectedProperty == 'Composite' && _isComposite(_generatedNumber!)) {
        break;
      }
      if (_selectedProperty == 'Multiple of 3' &&
          _isMultipleOf3(_generatedNumber!)) {
        break;
      }
      if (_selectedProperty == 'Multiple of 5' &&
          _isMultipleOf5(_generatedNumber!)) {
        break;
      }
      if (_selectedProperty == 'Multiple of 7' &&
          _isMultipleOf7(_generatedNumber!)) {
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

  bool _isComposite(int number) {
    if (number < 4) {
      return false;
    }
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return true;
      }
    }
    return false;
  }

  bool _isMultipleOf3(int number) {
    return number % 3 == 0;
  }

  bool _isMultipleOf5(int number) {
    return number % 5 == 0;
  }

  bool _isMultipleOf7(int number) {
    return number % 7 == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // add this line
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select the properties you want the random number to be based on:",
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                        value: 'Even',
                        groupValue: _selectedProperty,
                        onChanged: (value) {
                          setState(() {
                            _selectedProperty = value!;
                          });
                        },
                      ),
                      const Text("Even"),
                      Radio(
                        value: 'Odd',
                        groupValue: _selectedProperty,
                        onChanged: (value) {
                          setState(() {
                            _selectedProperty = value!;
                          });
                        },
                      ),
                      const Text("Odd"),
                      Radio(
                        value: 'Prime',
                        groupValue: _selectedProperty,
                        onChanged: (value) {
                          setState(() {
                            _selectedProperty = value!;
                          });
                        },
                      ),
                      const Text("Prime"),
                      Radio(
                        value: 'Composite',
                        groupValue: _selectedProperty,
                        onChanged: (value) {
                          setState(() {
                            _selectedProperty = value!;
                          });
                        },
                      ),
                      const Text("Composite"),
                      Radio(
                        value: 'Multiple of 3',
                        groupValue: _selectedProperty,
                        onChanged: (value) {
                          setState(() {
                            _selectedProperty = value!;
                          });
                        },
                      ),
                      const Text("Multiple of 3"),
                      Radio(
                        value: 'Multiple of 5',
                        groupValue: _selectedProperty,
                        onChanged: (value) {
                          setState(() {
                            _selectedProperty = value!;
                          });
                        },
                      ),
                      const Text("Multiple of 5"),
                      Radio(
                        value: 'Multiple of 7',
                        groupValue: _selectedProperty,
                        onChanged: (value) {
                          setState(() {
                            _selectedProperty = value!;
                          });
                        },
                      ),
                      const Text("Multiple of 7"),
                    ]),
              ),
              ElevatedButton(
                onPressed: _generateNumberWithProperty,
                child: const Text(
                  "Generate Number With Property",
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        _generatedNumber == null
            ? Container()
            : Text(
                'Generated Number: $_generatedNumber',
                style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
              ),
      ],
    );
  }
}
