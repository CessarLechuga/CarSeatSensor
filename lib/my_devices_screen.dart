import 'package:flutter/material.dart';
// --- 1. IMPORT the new detail screen ---
// (This also imports the Device class)
import 'device_detail_screen.dart';

// -------------------------------------------------
// MY DEVICES SCREEN (Updated)
// -------------------------------------------------

// --- 2. The 'Device' class has been MOVED ---
// (It's now in device_detail_screen.dart)

// We use a StatefulWidget because the state (like the switch) can change.
class MyDevicesScreen extends StatefulWidget {
  const MyDevicesScreen({super.key});

  @override
  State<MyDevicesScreen> createState() => _MyDevicesScreenState();
}

class _MyDevicesScreenState extends State<MyDevicesScreen> {
  // The list is now modifiable and starts empty
  final List<Device> myDevices = [
    // ---
    // I've left your test data here, commented out.
    // You can uncomment it to test the delete function.
    // ---
    Device(name: "Child 1's Car Seat", isDeviceOn: true, areAlertsOn: false),
    Device(name: "Child 2's Car Seat", isDeviceOn: true, areAlertsOn: true),
    Device(name: "Child 3's Car Seat", isDeviceOn: false, areAlertsOn: false),
  ];

  // Function to delete a device
  void _deleteDevice(int index) {
    // Get the name before deleting, to show in the message
    String deviceName = myDevices[index].name;

    setState(() {
      // This removes the device from the list
      myDevices.removeAt(index);
    });

    // Show a small confirmation message at the bottom
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$deviceName deleted."),
        backgroundColor: Colors.red[700],
      ),
    );
  }

  // --- 3. Function to open the detail screen ---
  void _openDeviceDetails(Device device) {
    Navigator.push(
      context,
      MaterialPageRoute(
        // Pass the tapped device to the new screen
        builder: (context) => DeviceDetailScreen(device: device),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // This automatically adds the back arrow
        title: const Text('My Devices'),
        centerTitle: true,
      ),
      // Show a message if the list is empty
      body: myDevices.isEmpty
          ? const Center(
              child: Text(
                "No devices have been added yet.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: myDevices.length,
              itemBuilder: (context, index) {
                final device = myDevices[index];

                // --- 4. WRAP the Card in an InkWell to make it tappable ---
                return InkWell(
                  onTap: () {
                    _openDeviceDetails(device);
                  },
                  borderRadius: BorderRadius.circular(15.0),
                  child: Card(
                    elevation: 2.0,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color(0xFFE0E0E0), // Card background color
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          // Icon for the device
                          Icon(
                            Icons.developer_board, // Placeholder icon
                            size: 40,
                            color: device.isDeviceOn
                                ? Colors.green[700]
                                : Colors.grey[600],
                          ),
                          const SizedBox(width: 16),

                          // Column for all the text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  device.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Device: ${device.isDeviceOn ? "ON" : "OFF"}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: device.isDeviceOn
                                        ? Colors.green[700]
                                        : Colors.red[700],
                                  ),
                                ),
                                Text(
                                  'Alerts: ${device.areAlertsOn ? "ON" : "OFF"}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: device.areAlertsOn
                                        ? Colors.green[700]
                                        : Colors.red[700],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // The Toggle Switch
                          Switch(
                            value: device.areAlertsOn,
                            onChanged: (newValue) {
                              // This updates the state when you tap the switch
                              setState(() {
                                device.areAlertsOn = newValue;
                              });
                            },
                            activeColor: Colors.green[700],
                          ),

                          // Add a delete button
                          IconButton(
                            icon: Icon(Icons.delete_outline,
                                color: Colors.red[700]),
                            onPressed: () {
                              _deleteDevice(index);
                            },
                            tooltip: 'Delete Device',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

