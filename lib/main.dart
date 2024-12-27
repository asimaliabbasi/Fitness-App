import 'package:flutter/material.dart';
import 'package:healtho_gym/common/color_extension.dart';
import 'package:healtho_gym/screen/login/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healtho_gym/database/database_helper.dart'; // Make sure this import is correct

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DatabaseHelper.initialize(); // Ensure this is awaited
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healtho Gym',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
