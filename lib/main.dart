import 'package:flutter/material.dart';

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
      ),
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: const SplashScreen(), // This sets your new screen as the home page.
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is the basic structure of a visual screen.
    return Scaffold(
      appBar: AppBar(
        // We make the AppBar invisible to just place the icon.
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // This is the settings icon on the top right.
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black54),
            onPressed: () {
              // Action for settings button goes here.
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretches buttons to fill width
            children: [
              // This is the main title text.
              const Text(
                'Smart Car Seat Device',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 80), // Adds space between title and buttons

              // This is the "Connect a new device" button.
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE0E0E0), // Button background color
                  foregroundColor: Colors.black87, // Text color
                  elevation: 4.0, // Shadow depth
                  shadowColor: Colors.grey.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  ),
                ),
                onPressed: () {
                  // Action for "Connect" button goes here.
                },
                child: const Text(
                  'Connect a new device',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 20), // Adds space between the two buttons

              // This is the "My devices" button.
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE0E0E0),
                  foregroundColor: Colors.black87,
                  elevation: 4.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  // Action for "My devices" button goes here.
                },
                child: const Text(
                  'My devices',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}