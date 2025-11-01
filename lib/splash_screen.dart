import 'package:flutter/material.dart';
import 'my_devices_screen.dart'; // Imports the "My Devices" screen
import 'settings_screen.dart'; // Imports the "Settings" screen
import 'connect_device_screen.dart'; // Imports the new "Connect" screen

// -------------------------------------------------
// SPLASH SCREEN (Home Screen)
// -------------------------------------------------

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
              // Action for settings button
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
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
                  // UPDATED: Action for "Connect" button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConnectDeviceScreen(),
                    ),
                  );
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
                  // Action for "My devices" button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyDevicesScreen(),
                    ),
                  );
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

