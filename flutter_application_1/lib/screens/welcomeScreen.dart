import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void registerScreen() {
    Navigator.of(context).pushReplacementNamed('RegisterScreen');
  }

  void loginScreen() {
    Navigator.of(context).pushReplacementNamed('LoginScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // image
              Image.asset(
                'images/logo.jpeg',
                height: 250,
              ),
              // title
              Text(
                "Welcome!",
                style: GoogleFonts.breeSerif(
                  fontSize: 30,
                ),
              ),
              // subtitle
              Text(
                "Manage and monitor your camera's\n system seamlessly with ease and\n efficiency",
                textAlign: TextAlign.center,
                style: GoogleFonts.breeSerif(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // login bottom
              GestureDetector(
                onTap: loginScreen,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          blurRadius: 10, // Softness of the shadow
                          offset: const Offset(0,
                              4), // Offset in X and Y (Y=4 for bottom shadow)
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      "login",
                      style: GoogleFonts.breeSerif(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //register bottom
              GestureDetector(
                onTap: registerScreen,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          blurRadius: 10, // Softness of the shadow
                          offset: const Offset(0,
                              4), // Offset in X and Y (Y=4 for bottom shadow)
                        ),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      "register",
                      style: GoogleFonts.breeSerif(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
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
