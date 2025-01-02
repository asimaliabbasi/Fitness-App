import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healtho_gym/common/color_extension.dart';
import 'package:healtho_gym/common_widget/round_button.dart';
import 'package:healtho_gym/common_widget/round_text_field.dart';
<<<<<<< HEAD
import 'firebase_options.dart';
import 'sign_up_screen.dart';
import 'package:healtho_gym/common/auth_service.dart';
=======
import 'firebase_options.dart'; // Make sure this is the correct path to your Firebase options file.
import 'sign_up_screen.dart'; // Import the SignUpScreen
import 'package:healtho_gym/pages/home_page.dart'; // Import HomePage
import 'package:healtho_gym/common/auth_service.dart'; // Import AuthService
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
<<<<<<< HEAD
  final AuthService _authService = AuthService();
=======
  final AuthService _authService = AuthService(); // Create an instance of AuthService
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> _login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Both fields are required.')),
      );
      return;
    }

<<<<<<< HEAD
=======
    // Use AuthService to handle login
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
    await _authService.signin(
      email: email,
      password: password,
      context: context,
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(  // Wrap the whole body in a SingleChildScrollView to avoid overflow
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08), // Use dynamic padding
          child: Column(
            children: [
              const SizedBox(height: 230),  // Add top space to avoid layout shift
              Image.asset(
                "assets/img/app_logo.png",
                width: size.width * 0.7, // Dynamic width for the logo
              ),
              const SizedBox(height: 30),
              RoundTextField(
                controller: _emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              RoundTextField(
                controller: _passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 40),
              RoundButton(
                title: "LOG IN",
                isPadding: false,
                onPressed: _login,
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()),
                  );
                },
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        // Placeholder for Facebook login logic
                      },
                      child: Container(
                        height: size.height * 0.05, // Responsive height for buttons
                        decoration: BoxDecoration(
                          color: const Color(0xff3A91F7),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/img/fb_logo.png", width: 20),
                            const SizedBox(width: 8),
                            const Text(
                              "Facebook",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        // Placeholder for Google login logic
                      },
                      child: Container(
                        height: size.height * 0.05, // Responsive height for buttons
                        decoration: BoxDecoration(
                          color: TColor.txtBG,
                          border: Border.all(color: TColor.board, width: 1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/img/google_logo.png", width: 20),
                            const SizedBox(width: 8),
                            Text(
                              "Google",
                              style: TextStyle(color: TColor.primaryText, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),  // Add some space at the bottom
            ],
          ),
=======
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              "assets/img/app_logo.png",
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            const SizedBox(height: 30),
            RoundTextField(
              controller: _emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            RoundTextField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 40),
            RoundButton(
              title: "LOG IN",
              isPadding: false,
              onPressed: _login,
            ),
            const SizedBox(height: 10),
            // "Don't have an account? Sign Up" text below login button, but above social login options
            TextButton(
              onPressed: () {
                // Navigate to the SignUpScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: Text(
                "Don't have an account? Sign up",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      // Placeholder for Facebook login logic
                    },
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xff3A91F7),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/img/fb_logo.png", width: 12, height: 12),
                          const SizedBox(width: 8),
                          const Text(
                            "Facebook",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      // Placeholder for Google login logic
                    },
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: TColor.txtBG,
                        border: Border.all(color: TColor.board, width: 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/img/google_logo.png", width: 12, height: 12),
                          const SizedBox(width: 8),
                          Text(
                            "Google",
                            style: TextStyle(color: TColor.primaryText, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
        ),
      ),
    );
  }
}
