import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final TextEditingController emailController = TextEditingController();

  void verifyScreen() async {
    final email = emailController.text;

    // Check if the email field is empty
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email')),
      );
      return;
    }

    // Send request to the server
    const url =
        'http://127.0.0.1/Remote_app/auth/reset.php'; // Replace with your server URL
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {'email': email},
      );

      if (response.statusCode == 200) {
        // Assume the process is successful and navigate to the VerifyScreen
        Navigator.of(context).pushReplacementNamed('VerifyScreen');
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to reset password')),
        );
      }
    } catch (e) {
      // Show error message when connection fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
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
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                  const Spacer(),
                ],
              ),
              Text(
                "Reset Password!",
                style: GoogleFonts.breeSerif(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Enter your email address to reset your password.",
                style: GoogleFonts.breeSerif(),
              ),
              const SizedBox(height: 30),
              // Email input field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 249, 249),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        blurRadius: 5, // Softness of the shadow
                        offset: const Offset(
                            0, 1), // Offset in X and Y (Y=4 for bottom shadow)
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your email",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Button to confirm the reset password request
              GestureDetector(
                onTap: verifyScreen,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: const EdgeInsets.all(10),
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
                        "Confirm",
                        style: GoogleFonts.breeSerif(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
