import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// -------------------------------------------------
// CONNECT DEVICE SCREEN
// -------------------------------------------------
// This screen scans for and displays nearby Bluetooth Low Energy devices

class ConnectDeviceScreen extends StatefulWidget {
  const ConnectDeviceScreen({super.key});

  @override
  State<ConnectDeviceScreen> createState() => _ConnectDeviceScreenState();
}

class _ConnectDeviceScreenState extends State<ConnectDeviceScreen> {
  bool _isScanning = false;

  // --- IMPORTANT PERMISSIONS NOTE ---
  // For this to work, you MUST add Bluetooth permissions to your project:
  //
  // 1. For Android (in /android/app/src/main/AndroidManifest.xml):
  //    <uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
  //    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
  //
  // 2. For iOS (in /ios/Runner/Info.plist):
  //    <key>NSBluetoothAlwaysUsageDescription</key>
  //    <string>This app needs Bluetooth to find your car seat</string>
  //    <key>NSBluetoothPeripheralUsageDescription</key>
  //    <string>This app needs Bluetooth to connect to your car seat</string>
  // -----------------------------------

  // --- Start Scanning ---
  void _startScan() {
    // Check if Bluetooth is enabled
    FlutterBluePlus.adapterState
        .where((state) => state == BluetoothAdapterState.on)
        .first
        .then((_) {
      // Start scanning
      setState(() => _isScanning = true);
      FlutterBluePlus.startScan(timeout: const Duration(seconds: 15));

      // Listen to scan results
      FlutterBluePlus.scanResults.listen((results) {
        // You can filter results here if needed
      });
    }).catchError((_) {
      // Show an error if Bluetooth is off
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please turn on Bluetooth to scan for devices')),
      );
    });

    // Listen for scan stop
    FlutterBluePlus.isScanning.where((isScanning) => !isScanning).listen((_) {
      setState(() => _isScanning = false);
    });
  }

  // --- Stop Scanning ---
  void _stopScan() {
    FlutterBluePlus.stopScan();
    setState(() => _isScanning = false);
  }

  // --- Build a list tile for each device found ---
  Widget _buildDeviceTile(ScanResult result) {
    // Only show devices that have a name
    if (result.device.platformName.isEmpty) {
      return const SizedBox.shrink(); // Empty widget
    }

    return ListTile(
      title: Text(result.device.platformName),
      subtitle: Text(result.device.remoteId.toString()),
      leading: const Icon(Icons.bluetooth),
      trailing: ElevatedButton(
        child: const Text('Connect'),
        onPressed: () {
          _stopScan(); // Stop scanning when we try to connect
          // ---
          // NEXT STEP: This is where we will add the connection logic
          // and navigate to the `device_detail_screen.dart`
          // ---
          print('Connecting to ${result.device.platformName}...');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Devices'),
      ),
      body: StreamBuilder<List<ScanResult>>(
        stream: FlutterBluePlus.scanResults,
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red)));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No devices found yet. Press the scan button!',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
          }

          // We have data, build the list
          final devices = snapshot.data!;
          return ListView.builder(
            itemCount: devices.length,
            itemBuilder: (context, index) {
              return _buildDeviceTile(devices[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isScanning ? _stopScan : _startScan,
        child: Icon(_isScanning ? Icons.stop : Icons.search),
      ),
    );
  }
}