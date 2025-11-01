import 'package:flutter/material.dart';

// -------------------------------------------------
// 1. Moved Device class here so both
//    screens can access it without any errors
// -------------------------------------------------
class Device {
  String name;
  bool isDeviceOn;
  bool areAlertsOn;

  Device({
    required this.name,
    this.isDeviceOn = true,
    this.areAlertsOn = true,
  });
}

// -------------------------------------------------
// 2. This is the new Device Detail Screen
// -------------------------------------------------
class DeviceDetailScreen extends StatefulWidget {
  // We pass in the device that was tapped
  final Device device;

  const DeviceDetailScreen({super.key, required this.device});

  @override
  State<DeviceDetailScreen> createState() => _DeviceDetailScreenState();
}

class _DeviceDetailScreenState extends State<DeviceDetailScreen> {
  // Dummy data for the toggles, as requested
  bool _notificationsOn = true;
  bool _phoneAlarmOn = false;
  bool _deviceAlarmOn = true;
  bool _emergencyContactOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title is the name of the device
        title: Text(widget.device.name),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // --- INFORMATION CARD ---
          _buildInfoCard(context),

          const SizedBox(height: 24),

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

  // Helper widget to build the info card
  Widget _buildInfoCard(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color(0xFFE0E0E0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // These are the dummy values from the ESP32
            Text(
              'Temperature: 24°C (75°F)', // Placeholder
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(
              'Battery: 85% (6 hours remaining)', // Placeholder
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
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
