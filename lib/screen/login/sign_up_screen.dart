import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healtho_gym/common/color_extension.dart';
import 'package:healtho_gym/common_widget/round_button.dart';
import 'package:healtho_gym/common_widget/round_text_field.dart';
import '../../pages/home_page.dart';
import 'firebase_options.dart'; // Ensure this path is correct

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firebase initialization
  Future<void> _initializeFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error initializing Firebase: $e')),
      );
    }
  }

  // Signup function
  Future<void> _signup() async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      final String username = _usernameController.text.trim();

      // Validation checks
      if (email.isEmpty || password.isEmpty || username.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All fields are required.')),
        );
        return;
      }

      // Firebase signup
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Optionally set the display name
      await userCredential.user?.updateDisplayName(username);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful!')),
      );

      // Navigate to Home page or another screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup failed: $e')),
      );
    }
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

=======
>>>>>>> 5d6b9a59195bd7bc27d0b0976e0a0540ced58bfe
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Set back arrow color
          onPressed: () {
            Navigator.pop(context); // Navigate back to the LoginScreen
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove shadow if necessary
      ),
<<<<<<< HEAD
      body: SingleChildScrollView(  // Wrap the body with SingleChildScrollView for scrollability
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),  // Dynamic padding based on screen size
          child: Column(
            children: [
              const SizedBox(height: 145), // Add top space to avoid layout shift
              Image.asset(
                "assets/img/app_logo.png",
                width: size.width * 0.7,  // Dynamic width for the logo
              ),
              const SizedBox(height: 30),
              // Username TextField
              RoundTextField(
                controller: _usernameController,
                hintText: "Username",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              // Email TextField
              RoundTextField(
                controller: _emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              // Password TextField
              RoundTextField(
                controller: _passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 40),
              // Sign Up Button
              RoundButton(
                title: "SIGN UP",
                isPadding: false,
                onPressed: _signup,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Facebook Signup Button
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        // Placeholder for Facebook signup logic
                      },
                      child: Container(
                        height: size.height * 0.05,  // Responsive height for buttons
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
                  // Google Signup Button
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {
                        // Placeholder for Google signup logic
                      },
                      child: Container(
                        height: size.height * 0.05,  // Responsive height for buttons
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
              const SizedBox(height: 50), // Add bottom space to maintain padding
            ],
          ),
=======
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
              controller: _usernameController,
              hintText: "Username",
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
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
              title: "SIGN UP",
              isPadding: false,
              onPressed: _signup,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Facebook Signup Button
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      // Placeholder for Facebook signup logic
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
                // Google Signup Button
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      // Placeholder for Google signup logic
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
