import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// ignore: unused_import
import 'package:flutter_application_1/screens/CalenderScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to validate email format
  bool isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  // Login logic to communicate with the backend
  Future<void> login() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    if (!isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    final url = Uri.parse('http://127.0.0.1/Remote_app/auth/login.php');

    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      void Calendarscreen() {
        Navigator.of(context).pushReplacementNamed('CalendarScreen');
      }

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['message'])),
          );
          Calendarscreen();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(responseData['message'])),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to connect to the server.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  void registerScreen() {
    Navigator.of(context).pushReplacementNamed('RegisterScreen');
  }

  void resetPass() {
    Navigator.of(context).pushReplacementNamed('ResetPass');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Back Icon
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                        ); // Navigate back to Welcome Page
                      },
                    ),
                    const Spacer(),
                  ],
                ),

                // Title
                Text(
                  "Login!",
                  style: GoogleFonts.breeSerif(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 50),

                // Email input field
                inputField(emailController, "Email", Icons.email, false),

                const SizedBox(height: 10),

                // Password input field
                inputField(passwordController, "Password", Icons.lock, true),

                const SizedBox(height: 10),

                // Login button
                GestureDetector(
                  onTap: login,
                  child: actionButton("Login"),
                ),
                const SizedBox(height: 25),

                // Forgot password link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: GoogleFonts.breeSerif(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: resetPass,
                      child: Text(
                        " Reset",
                        style: GoogleFonts.breeSerif(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Divider line
                const Divider(thickness: 1, color: Colors.black),
                const SizedBox(height: 20),

                // Sign-up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not yet a member? ",
                      style: GoogleFonts.breeSerif(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: registerScreen,
                      child: Text(
                        "Sign up now",
                        style: GoogleFonts.breeSerif(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField(TextEditingController controller, String hintText,
      IconData icon, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 250, 249, 249),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: Icon(icon),
            ),
            obscureText: isPassword,
          ),
        ),
      ),
    );
  }

  Widget actionButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.breeSerif(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
