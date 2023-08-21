import 'package:flutter/material.dart';
import 'package:number_app/location.dart';
// import 'package:number_app/mapScreen.dart';
import 'package:number_app/properties.dart';
import 'dart:math';
import './button1.dart';
import './text2.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var randomInt; // this generates the random number
  var count = 0; // Keep track of the number of generated numbers
  var number; // An array to store the generated numbers
  Widget? locationWidget;
  Position? currentPosition;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialogBox(context);
    });
  }

  void generateRandomInt() {
    setState(() {
      randomInt = Random().nextInt(100);
    });
  }

  void generateRandomInt2() {
    setState(() {
      if (count >= 100) {
        count = 0; // reset count back to 0
      }
      count = count + 1;
      if (count < 25) {
        number = Random().nextInt(7) + 6; //from
      } else if (count < 50) {
        number = Random().nextInt(10) + 3;
      } else if (count < 75) {
        number = Random().nextInt(4) + 3;
      } else {
        number = Random().nextInt(4) + 6;
      }
    });
  }

  void showDialogBox(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Allow Location Access'),
          content: const Text('Please enable location access to use this app.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                LocationPermission permission =
                    await Geolocator.requestPermission();
                if (permission == LocationPermission.denied) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Location permission denied'),
                    ),
                  );
                } else {
                  Navigator.of(context).pop(); // Close the dialog
                  await checkLocationPermission();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Location permission granted'),
                    ),
                  );
                }
              },
              child: const Text('Allow'),
            ),
          ],
        );
      },
    );
  }

  Future<void> checkLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    var enabled = await Geolocator.isLocationServiceEnabled();
    if (enabled &&
        (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse)) {
      try {
        Position position = await Geolocator.getCurrentPosition();
        setState(() {
          currentPosition = position;
        });
      } catch (e) {
        print(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permission denied'),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FirstButton(generateRandomInt),
              const SizedBox(
                height: 10,
              ),
              if (randomInt != null)
                Text(
                  "Number : $randomInt",
                  style: const TextStyle(fontSize: 20, color: Colors.redAccent),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(
                height: 20,
              ),
              Text2(generateRandomInt2),
              const SizedBox(
                height: 10,
              ),
              if (number != null)
                Text(
                  "Number[$count] : $number",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              Location(
                position: Position(
                  latitude: 0,
                  longitude: 0,
                  heading: 0.0,
                  speed: 0.0,
                  speedAccuracy: 0.0,
                  altitude: 0.0,
                  accuracy: 0.0,
                  floor: null,
                  timestamp: DateTime.now(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Properties(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
