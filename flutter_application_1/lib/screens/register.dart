import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/welcomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_application_1/screens/verify.dart' as verify;

/// The Register Screen - A Flutter widget to handle user registration.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers to manage the input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  /// Navigate to the Login Screen
  void loginScreen() {
    Navigator.of(context).pushReplacementNamed('LoginScreen');
  }

  /// Navigate to the Verify Screen
  void verifyScreen(String email) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => verify.VerifyScreen(email: email), // Pass email
      ),
    );
  }

  /// Handle the register process locally
  void register() {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    // Input validation: Check if any fields are empty
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    // Input validation: Check if passwords match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }

    // Simulate a successful registration
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Registration successful! Please verify your email.')),
    );

    // Navigate to the verification screen
    verifyScreen(email);
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
                // Page title
                Text(
                  "Register!",
                  style: GoogleFonts.breeSerif(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 50),

                // Name input field
                inputField(nameController, "Name"),
                const SizedBox(height: 20),

                // Email input field
                inputField(emailController, "Email"),
                const SizedBox(height: 20),

                // Password input field
                inputField(passwordController, "Password", isPassword: true),
                const SizedBox(height: 20),

                // Confirm password input field
                inputField(confirmPasswordController, "Confirm Password",
                    isPassword: true),
                const SizedBox(height: 25),

                // Sign Up button
                GestureDetector(
                  onTap: register, // Trigger registration function
                  child: Padding(
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
                          "Sign Up",
                          style: GoogleFonts.breeSerif(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Link to navigate to the Login Screen
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      style: GoogleFonts.breeSerif(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: loginScreen,
                      child: Text(
                        "Sign in here",
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

  /// Reusable widget for creating input fields
  Widget inputField(TextEditingController controller, String hintText,
      {bool isPassword = false}) {
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
            controller: controller, // Connect controller
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText, // Display placeholder
            ),
            obscureText: isPassword, // Hide text for password fields
          ),
        ),
      ),
    );
  }
}
