import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/First_floor.dart';
import 'package:flutter_application_1/screens/Ground_floor.dart';
import 'package:flutter_application_1/screens/Second_floor.dart';
import 'package:flutter_application_1/screens/Third_floor.dart';

class labs extends StatefulWidget {
  const labs({super.key});

  @override
  State<labs> createState() => _labsState();
}

class _labsState extends State<labs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '   Floors',
          style: TextStyle(fontSize: 35),
        ),
        elevation: 2,
        backgroundColor: const Color(0xffffe3e3),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFE3E3), Color(0xFFCEA2F4)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 100),
                  backgroundColor: const Color.fromARGB(
                      255, 244, 209, 94), // Background color
                  foregroundColor: Colors.black, // Text color
                  elevation: 5, // Shadow elevation
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Navigate to the SecondPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ground_floor()),
                  );
                },
                child: Text(
                  'Ground Floor',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 100),
                  backgroundColor: const Color.fromARGB(
                      255, 244, 209, 94), // Background color
                  foregroundColor: Colors.black, // Text color
                  elevation: 5, // Shadow elevation
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Navigate to the SecondPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => first_floor()),
                  );
                },
                child: Text(
                  'First Floor',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 100),
                  backgroundColor: const Color.fromARGB(
                      255, 244, 209, 94), // Background color
                  foregroundColor: Colors.black, // Text color
                  elevation: 5, // Shadow elevation
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Navigate to the SecondPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => second_floor()),
                  );
                },
                child: Text(
                  'Second Floor',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 100),
                  backgroundColor: const Color.fromARGB(
                      255, 244, 209, 94), // Background color
                  foregroundColor: Colors.black, // Text color
                  elevation: 5, // Shadow elevation
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Navigate to the SecondPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => third_floor()),
                  );
                },
                child: Text(
                  '3rd Floor',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
