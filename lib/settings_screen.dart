import 'package:flutter/material.dart';
import 'manage_contacts_screen.dart'; // Importa la nueva pantalla

// -------------------------------------------------
// SETTINGS SCREEN
// -------------------------------------------------

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Dummy data for the toggles
  bool _notificationsOn = true;
  bool _phoneAlarmOn = false;
  bool _deviceAlarmOn = true;
  bool _emergencyContactOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Emergency Contacts',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),

          // --- MANAGE CONTACTS BUTTON ---
          // Este es el botón que abre la nueva pantalla
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE0E0E0),
              foregroundColor: Colors.black87,
              elevation: 2.0,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onPressed: () {
              // Acción para abrir la pantalla de gestión de contactos
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ManageContactsScreen(),
                ),
              );
            },
            child: const Text(
              'Manage Contacts',
              style: TextStyle(fontSize: 16),
            ),
          ),
          // ------------------------------

          const SizedBox(height: 30),

          // --- NOTIFICATIONS SECTION ---
          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),

          // --- NOTIFICATION TOGGLES ---
          _buildNotificationToggle(
            title: 'Let the device send notifications to your phone',
            value: _notificationsOn,
            onChanged: (newValue) {
              setState(() => _notificationsOn = newValue);
            },
          ),
          _buildNotificationToggle(
            title: 'Let the device sound an alarm on your phone',
            value: _phoneAlarmOn,
            onChanged: (newValue) {
              setState(() => _phoneAlarmOn = newValue);
            },
          ),
          _buildNotificationToggle(
            title: 'Let the device sound an alarm on the device',
            value: _deviceAlarmOn,
            onChanged: (newValue) {
              setState(() => _deviceAlarmOn = newValue);
            },
          ),
          _buildNotificationToggle(
            title: 'Let the device alert emergency contact',
            value: _emergencyContactOn,
            onChanged: (newValue) {
              setState(() => _emergencyContactOn = newValue);
            },
          ),
        ],
      ),
    );
  }

  // Helper widget for the notification toggles
  Widget _buildNotificationToggle(
      {required String title,
      required bool value,
      required Function(bool) onChanged}) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.green[700],
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
    );
  }
}
