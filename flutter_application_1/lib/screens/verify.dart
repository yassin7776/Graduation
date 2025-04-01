import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class VerifyScreen extends StatefulWidget {
  final String? email; // The email to which the code was sent
  final String? name; // The name entered by the user during registration
  final String?
      password; // The password entered by the user during registration

  const VerifyScreen({super.key, this.email, this.name, this.password});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  bool _isResendDisabled = false;
  int _timerSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  // Verifying the entered code
  Future<void> _verifyCode() async {
    final enteredCode =
        _controllers.map((controller) => controller.text).join();

    if (enteredCode.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter the complete code')),
      );
      return;
    }

    const verifyUrl = 'http://127.0.0.1/Remote_app/auth/verifycode.php';
    const registerUrl = 'http://127.0.0.1/Remote_app/auth/register.php';

    try {
      final response = await http.post(
        Uri.parse(verifyUrl),
        body: {
          'email': widget.email ?? '',
          'code': enteredCode,
        },
      );

      if (response.statusCode == 200 && response.body == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification successful!')),
        );

        // Save user data to the database
        final saveResponse = await http.post(
          Uri.parse(registerUrl),
          body: {
            'name': widget.name ?? '',
            'email': widget.email ?? '',
            'password': widget.password ?? '',
          },
        );

        if (saveResponse.statusCode == 200 && saveResponse.body == "success") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User data saved successfully!')),
          );

          // Navigate to the login screen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save user data')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid verification code')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Resend the verification code
  void _resendCode() {
    setState(() {
      _isResendDisabled = true;
      _timerSeconds = 60;
    });
    _startResendTimer();
    print("Resending code to ${widget.email}");
  }

  // Start the resend timer countdown
  void _startResendTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds <= 0) {
        setState(() {
          _isResendDisabled = false;
          timer.cancel();
        });
      } else {
        setState(() {
          _timerSeconds--;
        });
      }
    });
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
                "Verification Code!",
                style: GoogleFonts.breeSerif(fontSize: 30),
              ),
              const SizedBox(height: 40),
              Text(
                "We have sent the verification code to ${widget.email}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: 40,
                      child: TextField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          } else {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                        controller: _controllers[index],
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20, letterSpacing: 2),
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _verifyCode,
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
              const SizedBox(height: 20),
              TextButton(
                onPressed: _isResendDisabled ? null : _resendCode,
                child: Text(
                  _isResendDisabled
                      ? "Resend code in $_timerSeconds seconds"
                      : "Resend code",
                  style: GoogleFonts.breeSerif(
                      fontSize: 16, color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
