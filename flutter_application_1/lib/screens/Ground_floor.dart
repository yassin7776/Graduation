import 'package:flutter/material.dart';

class ground_floor extends StatelessWidget {
  final List<int> labNumbers = [6001, 6002, 6003, 6004, 6005, 6006];

  ground_floor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Labs',
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: labNumbers.map((labNumber) {
                  return GestureDetector(
                    onTap: () {
                      _showOptionsDialog(context, labNumber);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 87, 171, 213),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 100,
                      width: (MediaQuery.of(context).size.width - 48) / 2,
                      child: Center(
                        child: Text(
                          'Lab $labNumber',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // turning all cameras on
                      print('Turning on all cameras');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 70),
                      backgroundColor: const Color.fromARGB(255, 244, 209, 94),
                      elevation: 5, // Shadow elevation
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                    ),
                    child: Text(
                      'Turn On All',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // turnning all cameras off
                      print('Turning off all cameras');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(400, 70),
                      backgroundColor: const Color.fromARGB(255, 244, 209, 94),
                      elevation: 5, // Shadow elevation
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10), // Button padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                    ),
                    child: Text(
                      'Turn Off All',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context, int labNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Turn On'),
                onTap: () {
                  // turnnig on code
                  print('Turning on Lab $labNumber cameras');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Turn Off'),
                onTap: () {
                  // turnning off code
                  print('Turning off Lab $labNumber cameras');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
