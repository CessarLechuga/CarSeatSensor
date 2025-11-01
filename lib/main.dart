import 'package:flutter/material.dart';
import 'splash_screen.dart'; // <-- 1. IMPORT your new screen file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp is the root of your app.
    return MaterialApp(
      title: 'Smart Car Seat',
      theme: ThemeData(
        // Set the background color for the whole app.
        scaffoldBackgroundColor: const Color(0xFFF0F0F0),
        brightness: Brightness.light,
        // Set the app bar theme to match the light background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF0F0F0),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black87), // Back arrow color
          titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: const SplashScreen(), // <-- 2.  imported it
    );
  }
}